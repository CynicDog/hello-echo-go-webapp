# ---------- Build Stage ----------
FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build the binary (static binary = no dependencies)
RUN go build -o server .

# ---------- Run Stage ----------
FROM debian:bookworm-slim

WORKDIR /app

# Copy binary and static/template assets
COPY --from=builder /app/server .
COPY --from=builder /app/static ./static
COPY --from=builder /app/templates ./templates

# Expose port (same as in main.go)
EXPOSE 8080

# Run the server
CMD ["./server"]
