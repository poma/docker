#!/bin/bash -e
# usage: init.sh 1.2.3.4
# more info: https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md
HOST=${1:-$(echo $DOCKER_HOST | awk -F'[/:]' '{print $4}')} # first arg or docker host from env var
echo "Initializing config for host '$HOST'"
docker-compose -f docker-compose.tcp.yml run --rm openvpn ovpn_genconfig -u tcp://$HOST:443
docker-compose -f docker-compose.tcp.yml run --rm openvpn bash -c 'yes | ovpn_initpki nopass'
docker-compose -f docker-compose.tcp.yml run --rm openvpn easyrsa build-client-full poma nopass
docker-compose -f docker-compose.tcp.yml run --rm openvpn ovpn_getclient poma > poma.ovpn
docker-compose -f docker-compose.tcp.yml up -d
