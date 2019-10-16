FROM debian:bullseye
MAINTAINER lukas.ignatavicius@locatory.com

RUN apt-get update -y \
    && apt-get install -y iptables curl ssh-client git \
    && rm -rf /var/lib/apt/lists/*

# docker
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 19.03.1

RUN set -x \
	&& curl -fSL "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v

CMD dockerd
