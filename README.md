# Build inetlinux/go

    docker build -t inetlinux/go .

# Unsing inetlinux/go

    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp inetlinux/go go build -v

    docker run --rm -v $PWD/src/csmp:/go/src/csmp inetlinux/go go build -v -o /go/src/csmp/app csmp/lms
