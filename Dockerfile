FROM centos:7

ENV GOLANG_VERSION 1.13.6
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN set -e; \
  yum install -y git;\
  curl -L https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz -o go.tgz; \
  tar -C /usr/local -xzf go.tgz; \
  /usr/local/go/bin/go version; \
  rm -f go.tgz;

WORKDIR $GOPATH

COPY main.go .
RUN go get -d -v . ;\
  rm -f main.go
