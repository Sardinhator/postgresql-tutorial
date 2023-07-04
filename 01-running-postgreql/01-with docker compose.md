# Running `Postgresql` with docker compose

Create a docker compose file name `docker-compose.yml` and copy this content:

## docker-compose.yml

```yaml
services:
  db:
    image: postgres:15.3
    restart: always
    environment:
      POSTGRES_PASSWORD: password
    ports:
      - 5432:5432
    volumes:
      - postgres_training_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

## Running the container

Running the container in the foreground:

```shell
docker compose up
```

Running the container as a background process:

```shell
docker compose up -d
```

## Shutting down the container

Shutting down the container

```shell
docker compose down
```

Shutting down the container and removing volumes

```shell
docker compose down --volumes
```
