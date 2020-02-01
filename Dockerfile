FROM centos:7

ENV GOLANG_VERSION 1.13.6

RUN set -e;\
  yum -y install git && \
  yum -y groupinstall "Development Tools" && \
  curl -sL https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
WORKDIR $GOPATH

COPY main.go .

# cleanup
RUN go get -d -v .; \
  go get -u github.com/golang/protobuf/protoc-gen-go; \
  go get -u -v github.com/mattn/go-sqlite3; \
  rm -f main.go; \
  yum clean all;
