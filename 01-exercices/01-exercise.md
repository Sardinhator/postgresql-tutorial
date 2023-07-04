# Exercises

Here are some beginner-level exercises for practicing PostgreSQL:

## Exercise 1

- Run a postgresql in a docker container
- Use `postgreql` in the docker container with `psql cli`.
- Using the psql cli create a new database called "mydb".
- Verify that the database was created.

## Exercise 2

Create a table named "employees" with the following columns:

```text
- id (integer, primary key)
- firstname (text)
- lastname (text)
- age (integer)
- salary (numeric)
```

## Exercise 3

Insert three records into the "employees" table with sample data.

## Exercise 4

Retrieve all records from the "employees" table.

## Exercise 5

Update the salary of the employee with ID 1 to 5000.

## Exercise 6

Delete the record of the employee with ID 2 from the "employees" table.

## Exercise 7

Add a new column named "department" of type text to the "employees" table.

## Exercise 8

Alter the "employees" table to rename the column "age" to "years_of_experience".

## Exercise 9

Create a new table named "departments" with the following columns:

- id (integer, primary key)
- name (text)

Exercise 10:
Write a query to join the "employees" and "departments" tables based on the department ID and retrieve the employee name, department name, and salary.

These exercises cover basic concepts such as database creation, table creation, data insertion, retrieval, updates, deletions, column additions, table alterations, and table joins. They should provide a good starting point for practicing and familiarizing yourself with PostgreSQL 10.
