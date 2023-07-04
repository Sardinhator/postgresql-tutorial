# Exercise 7

Add a new column named "department" of type text to the "employees" table.

## Solution

```shell
ALTER TABLE employees ADD department VARCHAR(255);
```

or

```shell
ALTER TABLE employees ADD COLUMN department VARCHAR(255);
```
