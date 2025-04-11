#!/bin/bash

output="$(npx @cloudflare/mcp-server-cloudflare init 2>&1)"

# 需要替换空白字符
json_text=$(echo "${output}" | tail -n 14 | head -n 12 | sed 's/│//g' | sed 's/[[:space:]]/ /g')

# 使用 jq 提取 command 和 args
command=$(echo ${json_text} | jq -r '.mcpServers.cloudflare.command')
args=$(echo ${json_text} | jq -r '.mcpServers.cloudflare.args | join(" ")')

# 拼接命令
full_command="$command $args"


npx -y supergateway \
  --stdio "${full_command}" \
  --port 8124 --ssePath /sse --messagePath /message