#!/bin/bash

project_root="$(pwd)"
session_name="mcp-servers"

if [ -f env.sh ]; then
  source env.sh
fi

if tmux has-session -t ${session_name} 2>/dev/null; then
  echo "Session ${session_name} exists. Killing it..."
  tmux kill-session -t ${session_name}
fi

tmux new-session -d -s ${session_name}

svc_array=(
  "github"
  "amap"
)

tmux new-window -t ${session_name} -n "default"

for svc in "${svc_array[@]}"; do
  tmux new-window -t ${session_name} -n "${svc}" -c "${project_root}/servers/" "bash ${svc}.sh ; read"
done

tmux attach-session -t ${session_name}
