package main

import (
	"fmt"

	_ "crypto/rsa"
	_ "crypto/sha256"
	_ "crypto/x509"

	_ "go.etcd.io/etcd/clientv3"

	_ "github.com/dgrijalva/jwt-go"
	_ "github.com/gin-gonic/gin"
	_ "github.com/golang/protobuf"
	_ "github.com/gorilla/context"
	_ "github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	_ "github.com/patrickmn/go-cache"
	_ "github.com/urfave/cli"

	_ "golang.org/x/net"
	_ "golang.org/x/sys"
	_ "google.golang.org/genproto"
	_ "google.golang.org/grpc"
)

func main() {
	fmt.Println("done")
}
