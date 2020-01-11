# Build inetlinux/go

    docker build -t inetlinux/go .

# Unsing inetlinux/go

    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp inetlinux/go go build -v
