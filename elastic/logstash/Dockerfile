ARG ELK_VERSION

FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}
COPY logstash.conf /usr/share/logstash/pipeline/logstash.conf

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
