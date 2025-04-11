#!/bin/bash

npx -y supergateway \
  --stdio "docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN=${GITHUB_PERSONAL_ACCESS_TOKEN} ghcr.io/github/github-mcp-server" \
  --port 8125 --ssePath /sse --messagePath /message
