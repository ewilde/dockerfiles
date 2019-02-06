FROM golang:1.10.4-alpine3.8 as build
RUN apk --no-cache add git
RUN git clone https://github.com/rakyll/hey.git /go/src/github.com/rakyll/hey
RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o /go/bin/hey ./src/github.com/rakyll/hey
FROM alpine:3.8
RUN addgroup -S app \
    && adduser -S -g app app

WORKDIR /home/app
COPY --from=build /go/bin/hey .

RUN chown -R app:app ./

USER app

ENTRYPOINT ["./hey"]
