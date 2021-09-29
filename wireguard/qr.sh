#!/bin/bash
ID=${1:-1}
docker-compose exec wireguard /app/show-peer $ID