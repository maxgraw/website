FROM golang:1.19 AS build

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-website

FROM gcr.io/distroless/base-debian11 AS release

WORKDIR /

COPY --from=build /docker-website /docker-website
COPY --from=build /app/static /static

EXPOSE 3000

USER nonroot:nonroot

ENTRYPOINT ["/docker-website"]