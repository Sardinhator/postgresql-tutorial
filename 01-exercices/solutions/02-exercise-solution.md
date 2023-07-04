# Exercise 2

```shell
mydb=# CREATE TABLE employees (id serial PRIMARY KEY, firstname VARCHAR(255), lastname VARCHAR(255), age SMALLINT, salary INTEGER);
```

Verify the content of the table:

```shell
mydb=# select * from employees;
 id | firstname | lastname | age | salary
----+-----------+----------+-----+--------
(0 ligne)
```
