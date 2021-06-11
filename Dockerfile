FROM golang
COPY . /$GOPATH/src/docker_demo/
WORKDIR /$GOPATH/src/docker_demo/
#设置环境变量，开启go module和设置下载代理
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct
#会在当前目录生成一个go.mod文件用于包管理
RUN go mod init
#增加缺失的包，移除没用的包
RUN go mod tidy
RUN go build app.go
EXPOSE 80:80
CMD ["go","run","cmd/http.go"]