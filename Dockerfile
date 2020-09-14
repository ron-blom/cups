FROM golang:1-stretch
LABEL maintainer "Ron Blom <blom.ron at gmail.com>"

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