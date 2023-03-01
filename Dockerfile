FROM golang:latest as build

WORKDIR /app

COPY . .

RUN go build -o hellofromgo ./cmd/hellofromgo/



FROM golang:latest as run

RUN groupadd -r hellofromgo && useradd -r -g hellofromgo hellofromgouser

USER hellofromgouser

COPY --from=build /app/hellofromgo .

EXPOSE 8080

ENTRYPOINT ["./hellofromgo"]