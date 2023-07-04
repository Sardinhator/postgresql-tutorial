# Exercise 6

Delete the record of the employee with ID 2 from the "employees" table.

## Solution

```shell
DELETE FROM employees
WHERE id = 2;
```

```shell
mydb=# DELETE FROM employees WHERE id=2;
DELETE 1
mydb=# select * from employees;
  3 | Nadia     | Gaga     |  42 | 1000000
  1 | Julie     | LeBreton |  48 |    5000
```
