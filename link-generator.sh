#!/bin/bash

generate_vless_link() {
    local UUID=$1
    local ADDRESS=${2:-"YOUR_VLESS_DOMAIN"}
    local PORT=${3:-"443"}
    local SNI=${4:-"YOUR_VLESS_DOMAIN"}
    local PUBLIC_KEY=${5:-"YOUR_PUBLIC_KEY"}
    local SHORT_ID=${6:-"YOUR_SHORT_ID"}
    local REMARKS=${7:-"YOUR_REMARKS"}

    echo "vless://${UUID}@${ADDRESS}:${PORT}?encryption=none&flow=xtls-rprx-vision&security=reality&sni=${SNI}&fp=chrome&pbk=${PUBLIC_KEY}&sid=${SHORT_ID}&type=tcp&headerType=none#${REMARKS}"
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <UUID> [ADDRESS] [PORT] [SNI] [PUBLIC_KEY] [SHORT_ID] [REMARKS]"
    echo "Example: $0 123e4567-e89b-12d3-a456-426614174000 example.com 443"
    exit 1
fi

generate_vless_link "$@"
