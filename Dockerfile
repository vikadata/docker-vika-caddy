
FROM caddy:2.5.1-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4 \
    # --with github.com/caddyserver/nginx-adapter@v0.0.4 \
    --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

FROM caddy:2.5.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy