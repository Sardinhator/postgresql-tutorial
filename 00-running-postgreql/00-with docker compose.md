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

## Using Postgresql CLI

```shell
 psql -h localhost -p 5432 -U postgres -W
```

In this command:

- `-h localhost` specifies the host, which is `localhost` because the PostgreSQL server is running on your local machine.
- `-p 5432` specifies the port.
- `-U postgres` specifies the user. The PostgreSQL Docker image creates a `postgres` user by default.
- `-W` forces `psql` to prompt for a password. Enter the password you set for the `POSTGRES_PASSWORD` environment variable when you started the Docker container.

### Example

```shell
❯ psql -h localhost -p 5432 -U postgres -W
Mot de passe :
psql (15.3 (Ubuntu 15.3-1.pgdg22.10+1))
Saisissez « help » pour l'aide.

postgres=#
```
