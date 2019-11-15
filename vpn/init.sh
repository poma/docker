#!/bin/bash -e
# more info: https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md
docker-compose run --rm openvpn ovpn_genconfig -u udp://vpn.viking-studio.com
docker-compose run --rm openvpn ovpn_initpki
docker-compose run --rm openvpn easyrsa build-client-full poma nopass
docker-compose run --rm openvpn ovpn_getclient poma > poma.ovpn
docker-compose up -d