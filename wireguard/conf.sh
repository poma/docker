#!/bin/bash
ID=${1:-1}
if ! [[ $ID =~ '^[0-9]+$' ]] ; then
   ID="_$ID"
fi
docker-compose cp wireguard:/config/peer$ID/peer$ID.conf ./wg$ID.conf