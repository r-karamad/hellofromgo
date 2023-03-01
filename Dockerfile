FROM golang:latest as build

WORKDIR /app

COPY . .

RUN go build -o hellofromgo ./cmd/hellofromgo/

FROM golang:latest as run

RUN groupadd -r hellofromgo && useradd --no-log-init -r -g hellofromgo hellofromgouser

COPY --from=build /app/hellofromgo .

USER hellofromgouser

EXPOSE 8080

ENTRYPOINT ["./hellofromgo"]