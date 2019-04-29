FROM ubuntu:18.04

WORKDIR /etc/code/data/downloads

RUN apt-get update
RUN apt-get install --no-install-recommends -y wget ca-certificates lsb-release curl git npm

RUN wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz

RUN npm install -g n
RUN npm install -g yarn
RUN n stable
RUN node -v
RUN npm -v

RUN tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /etc/code/
ENV GOROOT /usr/local/go/
RUN go version

WORKDIR /etc/code/

CMD sleep infinity
