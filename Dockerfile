FROM ubuntu:focal

# required packages to install docker according to the docks
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  ssh \
  # for ansible file copy
  rsync \
  git \
  # ships with python3.8.5 on focal
  python3 \
  python3-dev \
  python3-pip \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install docker-compose ansible poetry
