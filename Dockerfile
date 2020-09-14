FROM golang:1-stretch
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN mkdir /config \
  && apt-get update \
  && apt-get install -y build-essential libcups2-dev libsnmp-dev libavahi-client-dev git bzr avahi-daemon\
  && go get github.com/google/cloud-print-connector/... \
  && apt-get purge -y build-essential git bzr \
  && apt-get autoremove --purge -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf
ADD entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

# FROM alpine
# # FROM golang:alpine
# # FROM debian:stretch-slim


# ADD entrypoint.sh /opt/entrypoint.sh

# RUN apk add --no-cache avahi augeas && \
#     mkdir -p /go/bin && \
#     chmod +x /opt/entrypoint.sh

# # COPY --from=build /go /go


# ENTRYPOINT ["/opt/entrypoint.sh"]


# VOLUME /config

# CMD gcp-cups-connector -config-filename /config/gcp-cups-connector.config.json --log-to-console