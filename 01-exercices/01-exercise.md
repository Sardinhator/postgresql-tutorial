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

## Exercise 10

1. Create a new database named `acme_db`.
2. Create a table `employees` with the following fields:
   1. id (PRIMARY KEY)
   2. first name (TEXT)
   3. last name (TEXT)
   4. birthday (date)
   5. department id (FOREIGN KEY)
3. Create a table named `departments` with the following fields:
   1. id (integer, primary key)
   2. name (text)
