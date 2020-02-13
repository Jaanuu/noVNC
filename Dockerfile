FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y git python3 python3-numpy python3-websockify && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/noVNC

WORKDIR /opt/noVNC

copy . /opt/noVNC

EXPOSE 6080

CMD websockify --web=/opt/noVNC/ 6080 "${VNC_HOST_PORT:-host.docker.internal:5900}"
#CMD echo "${VNC_HOST_PORT:-host.docker.internal:5900}"