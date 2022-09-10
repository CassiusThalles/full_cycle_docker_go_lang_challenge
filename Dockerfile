FROM golang:latest AS builder

WORKDIR /home/

COPY . .

RUN GOOS=linux go build hello_world

FROM scratch

COPY --from=builder /home/hello_world .

ENTRYPOINT [ "./hello_world" ]
