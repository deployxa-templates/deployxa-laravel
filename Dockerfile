# Stage 1: CLI and Composer dependencies
FROM composer:2.7 AS vendor
WORKDIR /app
COPY composer*.json ./
RUN composer install \
    --no-dev \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

# Stage 2: Production Runner
FROM dunglas/frankenphp:latest-alpine AS runner
WORKDIR /app

RUN apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    zip \
    libzip-dev \
    unzip \
    git \
    oniguruma-dev \
    postgresql-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql pdo_pgsql mbstring zip bcmath pcntl

COPY . .
COPY --from=vendor /app/vendor ./vendor

RUN mkdir -p storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache \
    && chmod -R 777 storage bootstrap/cache

ENV PORT=8080
ENV FRANKENPHP_CONFIG="import /etc/caddy/Caddyfile"
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD php -r 'file_get_contents("http://localhost:8080/health") !== false ? exit(0) : exit(1);' || exit 1

CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]
