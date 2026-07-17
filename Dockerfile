FROM dunglas/frankenphp:latest-alpine
WORKDIR /app
COPY . .
RUN apk add --no-cache composer php82-cli php82-mbstring php82-xml php82-curl php82-openssl
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-dev --optimize-autoloader
EXPOSE 80
EXPOSE 443
ENV PORT=80
CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]
