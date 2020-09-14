Cups

Using images: 

tianon/google-cloud-print-connector https://github.com/tianon/dockerfiles/tree/master/google-cloud-print-connector

google-cloud-print-connector base on:
flungo/avahi https://github.com/flungo-docker/avahi
ydkn/cups https://gitlab.com/ydkn/docker-cups

volume: /etc/cups

# Build

docker build -t blomron/google-cloud-print-connector .

# Environment variables


# Run

docker run -it blomron/google-cloud-print-connector /bin/sh

# Deploy 

helm upgrade --install cups-chart ./cups-chart/