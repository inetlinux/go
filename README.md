# 介绍

由于防火墙的存在，使得下载golang的依赖包比较困难，特别维护在`golang.org`上的golang包，如gRPC依赖的`google.golang.org/grpc`。
本文在官方的`golang`镜像的基础上，将我开发中常用的golang依赖也一并打到docker镜像中，方便离线构建golang项目。

Using inetlinux/go
==================

这里描述两种使用场景

## 用于编译本地项目

    docker run --rm -v $PWD:/myapp -w /myapp inetlinux/go go build -v -o appname

    # 将本地项目映射到容器的$GOPATH/src目录下进行编译，编译完成后将在当前目录生成名为appname的文件
    docker run --rm -v $PWD:/go/src/myapp inetlinux/go go build -v -o /go/src/myapp/appname myapp

## 用于本地GOPATH

一般情况，项目开发中，我们需要频繁编译，上述方法就太低效了。可以使用以下方式，将`inetlinux/go`容器中的GOPATH映射到本地GOPATH，再去编译项目。第一次编译比较耗时，后续的编译就会快的多。

    export GOPATH=/mnt/go
    rm -rf $GOPATH && mkdir -p $GOPATH
    docker run -it --rm --mount type=volume,dst=/go,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$GOPATH inetlinux/go

Build inetlinux/go
==================

通过在hub.docker.com上关联github仓库，只要有代码提交，就可以自动构建镜像，但有时我们也需要手动构建，方法如下：

    docker build -t inetlinux/go .
    docker push inetlinux/go
