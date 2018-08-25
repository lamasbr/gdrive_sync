FROM golang:alpine

LABEL maintainer="lamasbr <falecom@interlli.ga>"

RUN \
    apk add gcc git && \
    CGO_ENABLED=0 go get -u github.com/odeke-em/drive/cmd/drive && \
    rm -rf /var/cache/apk/* && \
	rm -rf /go/src