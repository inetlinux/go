# 构建inetlinux/go

    docker build -t inetlinux/go .
    docker push inetlinux/go

# 使用inetlinux/go

## 用于编译本地项目

    docker run --rm -v $PWD:/myapp -w /myapp inetlinux/go go build -v -o appname

    docker run --rm -v $PWD/src/sometool:/go/src/sometool inetlinux/go go build -v -o /go/src/sometool/app sometool


## 将inetlinux/go中的GOPATH挂载到本地，作为GOPATH

    export GOPATH=/mnt/go
    rm -rf $GOPATH && mkdir -p $GOPATH
    docker run -it --rm --mount type=volume,dst=/go,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$GOPATH inetlinux/go
