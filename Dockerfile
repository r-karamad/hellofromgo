FROM golang:latest as builder

RUN groupadd -r hellofromgo && useradd --no-log-init -r -g hellofromgo hellofromgouser

WORKDIR /app

COPY go.mod go.sum ./

COPY . .

RUN go build -o hellofromgo ./cmd/hellofromgo/

USER hellofromgouser

EXPOSE 8080

CMD ["./hellofromgo"]