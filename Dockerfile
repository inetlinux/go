FROM centos:7

ENV GOLANG_VERSION 1.13.6

RUN set -e;\
  yum -y install git && \
  yum -y groupinstall "Development Tools" && \
  curl -sL https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xzv

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
WORKDIR $GOPATH

COPY main.go .

# cleanup
RUN go get -v .; rm -f main.go; yum clean all
