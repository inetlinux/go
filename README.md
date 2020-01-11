# Go programming

## Install Go

./install.sh

## How to Write Go Code

see https://golang.org/doc/code.html

### Code organization

* Go programmers typically keep all their Go code in a single workspace.
* A workspace contains many version control repositories (managed by Git, for example).
* Each repository contains one or more packages.

```
bin/
src/
    github.com/golang/example/
      .git/                    # Git repository metadata
      hello/
        hello.go               # command source
      outyet/
        main.go                # command source
        main_test.go           # test source
      stringutil/
        reverse.go             # package source
        reverse_test.go        # test source
    golang.org/x/image/
      .git
```


### GOPATH

The `GOPATH` environment variable specifies the location of your workspace. It defaults to a directory named go inside your home directory, so `$HOME/go` on Unix.

注意，`GOPATH`不得与Go安装路径相同。
