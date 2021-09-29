# WireGuard VPN server

WireGuard is a good replacement for OpenVPN. It's faster, more secure, and easier to use.

# Usage

- Run `docker-compose up -d` to start the VPN server
- Run `./conf.sh` to fetch a client config file or `./qr.sh` to show a QR code with client config

If you use multiple peers, you can use `./conf.sh 4` or `./conf.sh phone` to fetch respective config files (the same works with `./qr.sh`).

