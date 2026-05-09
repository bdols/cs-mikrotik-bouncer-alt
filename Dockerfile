FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o /cs-mikrotik-bouncer-alt .

FROM alpine:latest
COPY --from=builder /cs-mikrotik-bouncer-alt /cs-mikrotik-bouncer-alt
ENTRYPOINT ["/cs-mikrotik-bouncer-alt"]
