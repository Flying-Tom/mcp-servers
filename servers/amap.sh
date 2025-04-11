#!/bin/bash

npx -y supergateway \
  --stdio "AMAP_MAPS_API_KEY=${AMAP_MAPS_API_KEY} npx -y @amap/amap-maps-mcp-server" \
  --port 8123 --ssePath /sse --messagePath /message
