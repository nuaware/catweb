FROM buildbot/buildbot-worker:master

USER root

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh; \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
