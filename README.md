# Deployxa Laravel Starter

Production-ready Laravel template optimized for AI-assisted development and Deployxa Cloud.

---

## Why This Template?

This template represents the official Deployxa Cloud engineering standards for Laravel applications. It is designed to run perfectly out of the box and has been structured for optimal performance, security, and developer productivity when using AI coding assistants.

Compatible with major AI tools:
* Cursor
* Claude Code
* OpenCode
* GitHub Copilot
* Windsurf
* VS Code AI

---

## Features

* 🤖 AI-Agent Ready (Cursor, Claude Code, OpenCode, GitHub Copilot)
* 🚀 One-Click Deployxa Deployment
* 🐳 Production Dockerfile Included
* ⚡ Optimized Build Performance
* 🔒 Security Best Practices
* ❤️ Health Check Endpoint
* 📈 Cloud-Native Architecture
* 🌍 Ready for Custom Domains
* 🔄 CI/CD Ready
* 📦 Zero-Configuration Deployment

---

## Included

* **Dockerfile**: Advanced multi-stage FrankenPHP container.
* **docker-compose.yml**: Configured with Laravel web application.
* **Health Checks**: Root health check `/health` returning `{"status":"ok"}`.
* **Logging**: Production-grade stack logging config.
* **Security**: Non-root container permissions, security-hardened Alpine build.
* **CI Actions**: Preconfigured pipeline checking syntax, running tests, and validating Docker.

---

## Requirements

- PHP 8.2+
- Composer 2+
- Docker & Docker Compose (optional for containerized run)

---

## Installation

Clone the template and set up configurations:

```bash
cp .env.example .env
composer install
```

---

## Local Development

Start the local server:

```bash
php artisan serve
```

---

## Docker

Run the entire application environment with Docker Compose:

```bash
docker compose up --build
```

---

## Deploy to Deployxa

Deploy instantly via CLI:

```bash
deployxa deploy
```

For more documentation, visit the [Deployxa Documentation](https://docs.deployxa.com).

---

## Environment Variables

| Variable | Description | Default |
|---|---|---|
| `APP_NAME` | Name of the application | `Laravel` |
| `APP_ENV` | Mode of the application (local/production) | `production` |
| `APP_KEY` | Laravel App encryption key | `base64:...` |
| `APP_DEBUG` | Enable/Disable debug mode | `false` |
| `APP_URL` | Application root web URL | `http://localhost` |
| `LOG_LEVEL` | Level of logging output (debug/info/error) | `info` |

---

## Project Structure

```text
.github/
    workflows/
        ci.yml      # CI/CD Validation
docker/             # Configuration files
app/                # Core Application logic
public/             # Entrypoint and Static Assets
config/             # Configuration Settings
scripts/            # Operations Utilities
docs/               # Architectural Guides
tests/              # Automation Checks
.env.example        # Environment Template
Dockerfile          # FrankenPHP Container
docker-compose.yml  # Multi-container Setup
```

---

## Health Endpoint

Exposes a JSON payload at `/health`:

```json
{
  "status": "ok"
}
```

---

## Production Optimizations

- **FrankenPHP Runner**: Built on Caddy, delivering faster throughput than traditional PHP-FPM / Nginx architectures.
- **Caching**: Multi-stage dependency building uses docker caching mechanisms.
- **Docker Base**: Uses lightweight alpine image.

---

## AI Development

Optimized specifically for agents:
- `AGENTS.md` - Context guide.
- `CLAUDE.md` - Command guide.
- `COPILOT.md` - Editor rules.

---

## CI/CD

Validates code syntax, running tests, and constructs docker build cache on pull requests.

---

## Troubleshooting

- **Permissions**: Ensure storage and bootstrap/cache folders are writable.

---

## License

MIT
