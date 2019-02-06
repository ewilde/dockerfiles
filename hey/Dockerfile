FROM golang:1.10.4-alpine3.8 as build
RUN apk --no-cache add git
RUN go get -u github.com/rakyll/hey

FROM alpine:3.8
RUN addgroup -S app \
    && adduser -S -g app app

WORKDIR /home/app
COPY --from=build /go/bin/hey .

RUN chown -R app:app ./

USER app

ENTRYPOINT ["./hey"]
