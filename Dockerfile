FROM golang:1.10

EXPOSE 9735 10009
ENV GODEBUG netdns=cgo

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -d github.com/lightningnetwork/lnd


WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
RUN dep ensure -v
RUN go install -v ./...
COPY lnd.conf /root/.lnd/
CMD lnd
