# syntax=docker/dockerfile:1.7
# ---------------------------------------------------------------------------
# Stage 1: Builder
# ---------------------------------------------------------------------------
FROM golang:1.22-alpine AS builder

# Build-time metadata / args (never bake secrets here, only build inputs)
ARG APP_NAME=app
ARG APP_VERSION=dev
ARG TARGETOS=linux
ARG TARGETARCH=amd64

WORKDIR /src

# Leverage layer caching: deps first, source second
COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
    go build -trimpath -ldflags="-s -w -X main.version=${APP_VERSION}" \
    -o /out/${APP_NAME} ./cmd/${APP_NAME}

# ---------------------------------------------------------------------------
# Stage 2: Runtime (distroless/slim, non-root)
# ---------------------------------------------------------------------------
FROM gcr.io/distroless/static-debian12:nonroot AS runtime

ARG APP_NAME=app
ARG APP_VERSION=dev

LABEL org.opencontainers.image.title="${APP_NAME}" \
      org.opencontainers.image.version="${APP_VERSION}" \
      org.opencontainers.image.source="https://example.com/repo" \
      org.opencontainers.image.licenses="Apache-2.0"

ENV APP_NAME=${APP_NAME} \
    APP_VERSION=${APP_VERSION}

# distroless:nonroot already runs as uid 65532 (nonroot:nonroot)
USER nonroot:nonroot

WORKDIR /app
COPY --from=builder --chown=nonroot:nonroot /out/${APP_NAME} /app/${APP_NAME}

EXPOSE 8080
ENTRYPOINT ["/app/app"]
