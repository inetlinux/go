package main

import (
	"fmt"
	"time"

	_ "crypto/rsa"
	_ "crypto/sha256"
	_ "crypto/x509"
	"go.etcd.io/etcd/clientv3"

	_ "github.com/dgrijalva/jwt-go"
	_ "github.com/gin-gonic/gin"
	_ "github.com/gorilla/context"
	_ "github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	_ "github.com/patrickmn/go-cache"
	_ "github.com/urfave/cli"

	_ "google.golang.org/grpc"
)

func etcd_init() {
	cli, err := clientv3.New(clientv3.Config{
		Endpoints:   []string{"localhost:2379"},
		DialTimeout: 5 * time.Second,
	})
	if err != nil {
		fmt.Println("error in connect to etcd")
		return
	}
	defer cli.Close()
}

func main() {
	fmt.Println("hello")
}
