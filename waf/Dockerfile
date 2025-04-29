FROM golang:1.21-alpine

COPY src /waf

WORKDIR /waf

RUN go build .

CMD ./waf
