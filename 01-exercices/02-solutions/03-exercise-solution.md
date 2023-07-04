# Exercise 3

Insert three records into the "employees" table with sample data.

## Solution

### From the CLI

Here is an example:

```shell
mydb=# insert into employees (firstname, lastname, age, salary) VALUES ('Julie', 'LeBreton',48, 400000);
```

### From a UI Client

Although this can be achieved with the command line tool (psql cli) it is more efficient to use a UI client.
Install and configure `dbeaver.md`.

Verify that the data was entered:

```shell
mydb=# select * from employees;
 id | firstname | lastname | age |  salary
----+-----------+----------+-----+----------
  1 | Lady      | Gaga     |  23 | 40000000
  2 | Julie     | LeBreton |  48 |   400000
  3 | Julie     | Masse    |  58 |       80
(3 lignes)
```
