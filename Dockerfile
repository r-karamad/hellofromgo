FROM golang:latest as build

WORKDIR /app

COPY . .

RUN go build -o hellofromgo ./cmd/hellofromgo/



FROM golang:latest as run

RUN groupadd -r reporter && useradd -r -g reporter reporter

USER reporter

COPY --from=build /app/hellofromgo .

EXPOSE 8080

ENTRYPOINT ["./hellofromgo"]