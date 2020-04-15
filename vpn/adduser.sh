#!/bin/bash -e
echo "Adding user '$1'"
docker-compose run --rm openvpn easyrsa build-client-full $1 nopass
docker-compose run --rm openvpn ovpn_getclient $1 > $1.ovpn