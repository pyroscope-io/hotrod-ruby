# Sinatra Docker

This is a project to troubleshoot accessing Sinatra from Docker.

## Local

```bash
ruby app.rb
```

## Docker

```bash
docker-compose build
docker-compose run --rm app ruby app.rb
```