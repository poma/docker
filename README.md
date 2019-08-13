# Docker infrastructure scripts

My scripts to quickly bring up common docker infrastructure. All compose files don't bind any custom config files so it is usable on 
remote docker instances without copying any files. This is intended for smaller scale deployments on few machines using docker-compose.
For larger scale infrastructure you should use Kubernetes anyway.

# Frontend

Consists of [nginx](https://github.com/jwilder/nginx-proxy)-[dockergen](https://github.com/jwilder/docker-gen)-[letsencrypt](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) 
stack to proxy http requests to multiple containers. Advanced version is a bit more complex, but is more secure and monitoring friendly.

Usage:

`docker-compose up -d` on any host, then run any container *on the same network* with appropriate env variables:

```yaml
version: '2'
services:
  app:
    image: app
    environment:
      VIRTUAL_HOST: example.com
      LETSENCRYPT_HOST: example.com
networks:
  default:
    external:
      name: frontend_default
```

Frontend will automatically generate nginx conf and a valid https certificate (if the domain has a valid DNS record) and will 
route all requests for specified host to this container. After https certificate is generated http endpoint will contain a redirect to https.

For more info see [nginx proxy docs](https://github.com/jwilder/nginx-proxy)

# Monitoring agent

Configured filebeat and metricbeat agents for ELK stack for log and metric ingestion. Collects all container logs, syslog, and auth log, 
and various container and host metrics. Indexes for advanced nginx stack above are already configured.

To run the agent configure .env variables:

```
cd monitoring
cp .env.example .env
vi .env
```

then run `docker-compose up -d`. Note that for monitoring we build the containers so if you change yaml configs in filebeat 
and metricbeat dir don't forget `--build` flag when updating containers.
