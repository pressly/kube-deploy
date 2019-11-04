FROM alpine:3.10

RUN apk add -U openssl curl tar gzip bash ca-certificates

# glibc https://github.com/sgerrand/alpine-pkg-glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add glibc-2.30-r0.apk && \
    rm glibc-2.30-r0.apk

# kubectl
RUN curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl && \
    kubectl version --client

# yaml transformations tool - https://github.com/VojtechVitek/yaml-cli 
RUN curl -L -o /usr/bin/yaml https://github.com/VojtechVitek/yaml-cli/releases/download/v0.0.4/yaml-linux64 && \
    chmod +x /usr/bin/yaml

# secrets hydration tool - https://github.com/pressly/hydrate
RUN curl -L -o /usr/bin/hydrate https://github.com/pressly/hydrate/releases/download/v0.0.3/hydrate-linux64 && \
    chmod +x /usr/bin/hydrate
