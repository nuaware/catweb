FROM golang:latest
COPY catweb.go /go
RUN go build catweb.go

FROM ubuntu:latest
COPY --from=0 /go/catweb /
COPY templates/index.html /
COPY static/* /static/
EXPOSE 8080
CMD /catweb
