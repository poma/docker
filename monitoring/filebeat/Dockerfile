ARG ELK_VERSION
FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

# USER root
COPY --chown=root:filebeat filebeat.yml /usr/share/filebeat/filebeat.yml
COPY --chown=root:filebeat pipeline.json /usr/share/filebeat/module/nginx/access/ingest/default.json

