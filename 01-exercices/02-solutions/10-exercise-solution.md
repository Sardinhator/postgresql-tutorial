# Exercise 10

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

## Solution

- Exit from the current session
- Run `psql` to run commands on the postgresql instance in the docker container.

  ```shell
  - psql -h localhost -p 5432 -U postgres -W
  ```

### Create a new database named `acme_db`

```sql
CREATE DATABASE acme_db;
```

```sql
-- Drop tables if they exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birthday DATE,
    department_id INTEGER,
    CONSTRAINT fk_department FOREIGN KEY(department_id) REFERENCES departments(id)
);

-- Insert data into departments table
INSERT INTO departments (name) VALUES
    ('Sales'),
    ('Marketing'),
    ('Finance'),
    ('Human Resources'),
    ('IT');

-- Insert data into employees table
INSERT INTO employees (first_name, last_name, birthday, department_id) VALUES
    ('John', 'Doe', '1990-05-15', 1),
    ('Jane', 'Smith', '1988-10-28', 2),
    ('Michael', 'Johnson', '1992-03-07', 3),
    ('Emily', 'Williams', '1995-12-12', 4),
    ('David', 'Brown', '1991-07-02', 5);

```

## Additional exercises with those tables and that data

Here are five exercises to learn basic SQL commands using the "departments" and "employees" tables:

## Exercise 1: Retrieve all departments

```sql
SELECT * FROM departments;
```

## Exercise 2: Retrieve the names of all employees

```sql
SELECT first_name, last_name FROM employees;
```

## Exercise 3: Retrieve the employees whose birthday is after 1990-01-01

```sql
SELECT * FROM employees WHERE birthday > '1990-01-01';
```

## Exercise 4: Retrieve the employees along with their department names

```sql
SELECT e.*, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;
```

```shell
acme_db=# select e.*, d.name as department_name from employees e JOIN departments d ON e.department_id = d.id;
 id | first_name | last_name |  birthday  | department_id | department_name
----+------------+-----------+------------+---------------+-----------------
  1 | John       | Doe       | 1990-05-15 |             1 | Sales
  2 | Jane       | Smith     | 1988-10-28 |             2 | Marketing
  3 | Michael    | Johnson   | 1992-03-07 |             3 | Finance
  4 | Emily      | Williams  | 1995-12-12 |             4 | Human Resources
  5 | David      | Brown     | 1991-07-02 |             5 | IT
(5 lignes)
```

## Exercise 5: Retrieve the count of employees in each department

```sql
SELECT d.name AS department_name, COUNT(*) AS employee_count
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d.name;
```

```shell
acme_db=# select d.name as department_name, COUNT(*) AS employee_count FROM employees e JOIN departments d ON e.department_id = d.id GROUP BY d.name;
 department_name | employee_count
-----------------+----------------
 Marketing       |              1
 Finance         |              1
 Human Resources |              1
 Sales           |              1
 IT              |              1
(5 lignes)
```

These exercises cover basic SQL commands such as SELECT, WHERE, JOIN, and GROUP BY, and they allow you to practice retrieving data from the tables, applying filters, joining tables, and performing aggregations.

You can execute each SQL statement separately to see the results and verify your understanding of the commands. Feel free to modify the exercises or explore additional queries based on your learning needs.
