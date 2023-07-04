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
INSERT INTO departments (name)
VALUES ('Sales'),
    ('Marketing'),
    ('Finance'),
    ('Human Resources'),
    ('IT');
-- Insert data into employees table
INSERT INTO employees (first_name, last_name, birthday, department_id)
VALUES ('John', 'Doe', '1990-05-15', 1),
    ('Jane', 'Smith', '1988-10-28', 2),
    ('Michael', 'Johnson', '1992-03-07', 3),
    ('Emily', 'Williams', '1995-12-12', 4),
    ('David', 'Brown', '1991-07-02', 5);