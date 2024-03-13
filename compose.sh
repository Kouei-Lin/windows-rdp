#!/bin/bash

# Prompt user for input ID
read -p "Please enter an ID between 1 and 99: " ID && \

# Validate input ID
if [[ ! $ID =~ ^[1-9][0-9]?$ ]]; then
    echo "Invalid ID. ID must be between 1 and 99." && \
    exit 1
fi && \

# Generate Docker Compose file
cat <<EOF > docker-compose.yml && \

version: "3"
services:
  windows:
    image: dockurr/windows
    container_name: win$ID
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 500$ID:8006
      - 600$ID:3389/tcp
      - 600$ID:3389/udp
    stop_grace_period: 2m
    restart: on-failure
    environment:
      RAM_SIZE: "6G"
    volumes:
      - /vol/win$ID:/storage
EOF
