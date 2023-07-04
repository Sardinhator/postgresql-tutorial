# Exercise 1 - Solution

## Run a postgresql in a docker container

Create a `docker-compose.yml` file with the following content. You can use more recent versions.

```yml
services:
  postgresql_db:
    image: postgres:15.3
    restart: always
    environment:
      POSTGRES_PASSWORD: password
    ports:
      - 5432:5432
    volumes:
      - 01_exercices_psql_data:/var/lib/postgresql/data

volumes:
  01_exercices_psql_data:
```

## Use `postgreql` in the docker container with `psql cli`

```shell
❯ psql -h localhost -p 5432 -U postgres -W
Mot de passe :
psql (15.3 (Ubuntu 15.3-1.pgdg22.10+1))
Saisissez « help » pour l'aide.

postgres=#
```

## Using the psql cli create a new database called "mydb"

```shell
postgres=# create database mydb;
CREATE DATABASE
postgres=#
```

## Verify that the database was created

```shell
postgres=# \l
                                                    Liste des bases de données
    Nom    | Propriétaire | Encodage | Collationnement | Type caract. | Locale ICU | Fournisseur de locale |    Droits d'accès
-----------+--------------+----------+-----------------+--------------+------------+-----------------------+-----------------------
 mydb      | postgres     | UTF8     | en_US.utf8      | en_US.utf8   |            | libc                  |
 postgres  | postgres     | UTF8     | en_US.utf8      | en_US.utf8   |            | libc                  |
 template0 | postgres     | UTF8     | en_US.utf8      | en_US.utf8   |            | libc                  | =c/postgres          +
           |              |          |                 |              |            |                       | postgres=CTc/postgres
 template1 | postgres     | UTF8     | en_US.utf8      | en_US.utf8   |            | libc                  | =c/postgres          +
           |              |          |                 |              |            |                       | postgres=CTc/postgres
(4 lignes)
```

Observe that `mydb` database is there.
