FROM centos:7

ENV GOLANG_VERSION 1.13.6

RUN set -e;\
  yum install -y git;\
  curl -L https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz -o /tmp/go.tgz;\
  tar -C /usr/local -xzf /tmp/go.tgz;\
  /usr/local/go/bin/go version;

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
WORKDIR $GOPATH

COPY main.go .

RUN go get -d -v .;\
 rm -f main.go /tmp/go.tgz;
