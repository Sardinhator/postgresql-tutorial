# SQL

## Basic string search

Here's a guide to performing string searches in a PostgreSQL database with examples:

### Basic String Search

To perform a basic string search, you can use the `LIKE` operator with wildcard characters `%` (matches any sequence of characters) and `_` (matches any single character).

```sql
SELECT * FROM table_name WHERE column_name LIKE 'search_term';
```

Example:

```sql
SELECT * FROM employees WHERE first_name LIKE 'John%';
```

This query will retrieve all employees whose first name starts with "John".

### Case-Insensitive Search

To perform a case-insensitive search, you can use the `ILIKE` operator instead of `LIKE`.

```sql
SELECT * FROM table_name WHERE column_name ILIKE 'search_term';
```

Example:

```sql
SELECT * FROM employees WHERE last_name ILIKE 'Smith';
```

This query will retrieve all employees whose last name is "Smith" (case-insensitive).

### Partial String Match

To search for a specific string within a larger string, you can use the `%` wildcard character.

```sql
SELECT * FROM table_name WHERE column_name LIKE '%search_term%';
```

Example:

```sql
SELECT * FROM employees WHERE first_name LIKE '%a%';
```

This query will retrieve all employees whose first name contains the letter "a".

### Regular Expression Search

PostgreSQL supports regular expressions for more complex string searches. You can use the `~` or `~*` operator to perform a regular expression search.

```sql
SELECT * FROM table_name WHERE column_name ~ 'regex_pattern';
```

Example:

```sql
SELECT * FROM employees WHERE first_name ~ '^(J|D)oh';
```

This query will retrieve all employees whose first name starts with either "Jo" or "Do" using a regular expression pattern.

### Pattern Matching with ESCAPE

If your search term contains wildcard characters like `%` or `_` that need to be matched literally, you can use the `ESCAPE` clause.

```sql
SELECT * FROM table_name WHERE column_name LIKE 'search_term' ESCAPE 'escape_character';
```

Example:

```sql
SELECT * FROM employees WHERE first_name LIKE 'Smi!_%' ESCAPE '!';
```

This query will retrieve all employees whose first name starts with "Smi\_" where the underscore is matched literally.

These examples demonstrate different ways to perform string searches in a PostgreSQL database. You can customize the queries based on your specific search requirements and use cases. Remember to replace `table_name` and `column_name` with the actual table and column names in your database.

## Matching against multiple possible values

Here's a guide to performing SQL queries for matching against multiple possible values using the `IN` operator, both with and without `subqueries`, with examples:

### Using the IN Operator with a List of Values

To match against multiple possible values using the `IN` operator, you can specify a comma-separated list of values enclosed in parentheses.

```sql
SELECT * FROM table_name WHERE column_name IN (value1, value2, value3, ...);
```

Example:

```sql
SELECT * FROM employees WHERE department_id IN (1, 3, 5);
```

This query will retrieve all employees whose department_id is either 1, 3, or 5.

### Using the IN Operator with a Subquery

The `IN` operator can also be used with a subquery to match against multiple values derived from another query.

```sql
SELECT * FROM table_name WHERE column_name IN (SELECT ... FROM ...);
```

Example:

```sql
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE name LIKE 'Sales%');
```

This query will retrieve all employees whose department_id matches the id values obtained from the subquery, which selects the department IDs of departments with names starting with "Sales".

### Using the NOT IN Operator

You can use the `NOT IN` operator to exclude rows that match the specified values or subquery results.

```sql
SELECT * FROM table_name WHERE column_name NOT IN (value1, value2, value3, ...);
```

Example:

```sql
SELECT * FROM employees WHERE department_id NOT IN (2, 4);
```

This query will retrieve all employees whose department_id is neither 2 nor 4.

### Using a Subquery to Match Against Multiple Columns

You can also use a subquery to match against multiple columns by combining the `IN` operator with multiple columns in the subquery's select clause.

```sql
SELECT * FROM table_name WHERE (column1, column2) IN (SELECT ... FROM ...);
```

Example:

```sql
SELECT * FROM employees WHERE (first_name, last_name) IN (SELECT first_name, last_name FROM employees_archive);
```

This query will retrieve all employees whose first name and last name match the corresponding values in the subquery, which selects the first name and last name from an "employees_archive" table.

By utilizing the `IN` operator, you can easily match against multiple possible values or subquery results, allowing for more flexible and targeted SQL queries. Remember to replace `table_name`, `column_name`, and other placeholders with the actual table and column names in your database.

## Classify results into buckets

Here are some examples of how to classify results into buckets using SQL queries:

### Using CASE Statement for Simple Bucket Classification

You can use the `CASE` statement in SQL to classify results into buckets based on specific conditions.

Example:

```sql
SELECT column_name,
       CASE
           WHEN column_name < 10 THEN 'Bucket 1'
           WHEN column_name >= 10 AND column_name < 20 THEN 'Bucket 2'
           ELSE 'Bucket 3'
       END AS bucket
FROM table_name;
```

In this example, the results are classified into three buckets based on the value of `column_name`. Values less than 10 are assigned to "Bucket 1," values between 10 and 19 (inclusive) are assigned to "Bucket 2," and all other values are assigned to "Bucket 3."

### Using RANGE Condition for Bucket Classification

You can use range conditions in SQL to classify results into buckets based on a specific range of values.

Example:

```sql
SELECT column_name,
       CASE
           WHEN column_name BETWEEN 0 AND 9 THEN 'Bucket 1'
           WHEN column_name BETWEEN 10 AND 19 THEN 'Bucket 2'
           ELSE 'Bucket 3'
       END AS bucket
FROM table_name;
```

In this example, the results are classified into three buckets based on the range of values in `column_name`. Values between 0 and 9 (inclusive) are assigned to "Bucket 1," values between 10 and 19 (inclusive) are assigned to "Bucket 2," and all other values are assigned to "Bucket 3."

### Using Named Buckets with Subquery or Common Table Expression (CTE)

You can define named buckets using subqueries or common table expressions (CTEs) and then join them to the main query for bucket classification.

Example using a Subquery:

```sql
SELECT t.column_name, b.bucket_name
FROM table_name t
JOIN (
    SELECT 'Bucket 1' AS bucket_name, 0 AS lower_limit, 9 AS upper_limit
    UNION ALL
    SELECT 'Bucket 2' AS bucket_name, 10 AS lower_limit, 19 AS upper_limit
    UNION ALL
    SELECT 'Bucket 3' AS bucket_name, 20 AS lower_limit, 9999 AS upper_limit
) b ON t.column_name >= b.lower_limit AND t.column_name <= b.upper_limit;
```

In this example, the results are classified into buckets based on named ranges defined in the subquery. Each bucket has a lower and upper limit, and the main query joins the subquery based on the conditions to assign the appropriate bucket name.

These examples demonstrate how to classify results into buckets using SQL queries. You can customize the bucket ranges, conditions, and bucket names based on your specific requirements. Replace `column_name` and `table_name` with the actual column and table names from your database.

## Working with dates

Certainly! Here's a comprehensive guide with examples of working with dates in SQL:

### Retrieve Current Date and Time

To retrieve the current date and time, you can use the `CURRENT_DATE` and `CURRENT_TIMESTAMP` functions.

Example:

```sql
SELECT CURRENT_DATE;           -- Retrieves the current date
SELECT CURRENT_TIMESTAMP;      -- Retrieves the current date and time
```

### Format Dates

To format dates in a specific way, you can use the `TO_CHAR` function with appropriate format codes.

Example:

```sql
SELECT TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD');      -- Formats date as 'YYYY-MM-DD'
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH:MI:SS');  -- Formats date and time as 'YYYY-MM-DD HH:MI:SS'
```

### Extract Parts of a Date

You can extract specific parts of a date, such as year, month, day, etc., using the `EXTRACT` function.

Example:

```sql
SELECT EXTRACT(YEAR FROM current_date);       -- Extracts the year from the current date
SELECT EXTRACT(MONTH FROM current_date);      -- Extracts the month from the current date
SELECT EXTRACT(DAY FROM current_date);        -- Extracts the day from the current date
```

### Perform Date Arithmetic

You can perform arithmetic operations with dates, such as adding or subtracting days, months, or years.

Example:

```sql
SELECT CURRENT_DATE + INTERVAL '7 days';       -- Adds 7 days to the current date
SELECT CURRENT_DATE - INTERVAL '1 month';      -- Subtracts 1 month from the current date
```

### Filter by Date

To filter rows based on specific date criteria, you can use comparison operators such as `<`, `>`, `=`, etc.

Example:

```sql
SELECT * FROM table_name WHERE date_column > '2022-01-01';   -- Retrieves rows with date_column after '2022-01-01'
```

### Group by Date

To group rows by a specific date part, such as year or month, you can use the `GROUP BY` clause with appropriate date functions.

Example:

```sql
SELECT EXTRACT(YEAR FROM date_column) AS year, COUNT(*) AS count
FROM table_name
GROUP BY year;
```

### Calculate Date Differences

To calculate the difference between two dates, you can use the `DATEDIFF` or `DATE_PART` function.

Example:

```sql
SELECT DATEDIFF('day', start_date, end_date) AS day_diff    -- Calculates the difference in days
FROM table_name;
```

### Working with Time Zones

To work with dates in different time zones, you can use the `AT TIME ZONE` operator or the `SET TIME ZONE` command.

Example:

```sql
SELECT current_timestamp AT TIME ZONE 'UTC';     -- Converts current timestamp to UTC
SET TIME ZONE 'UTC';                             -- Sets the time zone to UTC for subsequent queries
```

These examples cover various aspects of working with dates in SQL. You can modify the queries and functions based on your specific database and requirements. Remember to replace `table_name` and `date_column` with the actual table and column names from your database.

## Removing duplicates (Distinct)

Here's a guideline with examples on how to remove duplicates from an SQL query:

### Using DISTINCT Keyword

The `DISTINCT` keyword eliminates duplicate rows from the query result. It considers the values of all selected columns to identify duplicates.

Example:

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

In this example, the `DISTINCT` keyword ensures that only unique combinations of values from `column1`, `column2`, etc., are returned, effectively removing duplicate rows.

### Using GROUP BY Clause

You can use the `GROUP BY` clause to group rows by specific columns and then select an aggregate function like `MIN()`, `MAX()`, or `COUNT()` to choose a representative row from each group.

Example:

```sql
SELECT column1, column2, ...
FROM table_name
GROUP BY column1, column2, ...;
```

In this example, the `GROUP BY` clause groups rows based on the specified columns, and each group is represented by a single row. Duplicate rows are eliminated.

### Using ROW_NUMBER() Window Function

The `ROW_NUMBER()` window function assigns a unique sequential number to each row within a specific partition. You can utilize this function to eliminate duplicates by selecting rows with a row number of 1.

Example:

```sql
SELECT column1, column2, ...
FROM (
    SELECT column1, column2, ..., ROW_NUMBER() OVER (PARTITION BY column1, column2, ... ORDER BY column1) AS row_num
    FROM table_name
) subquery
WHERE row_num = 1;
```

In this example, the `ROW_NUMBER()` function assigns a unique row number to each row within the specified columns. The outer query selects only rows with a row number of 1, effectively removing duplicates.

### Using EXISTS or NOT EXISTS Subquery

You can use the `EXISTS` or `NOT EXISTS` subquery to eliminate duplicates by checking the presence or absence of matching rows based on specific criteria.

Example:

```sql
SELECT column1, column2, ...
FROM table_name t1
WHERE NOT EXISTS (
    SELECT 1
    FROM table_name t2
    WHERE t1.column1 = t2.column1
    AND t1.column2 = t2.column2
    ...
    AND t1.id < t2.id
);
```

In this example, the `NOT EXISTS` subquery checks for rows in `table_name` with the same values of `column1`, `column2`, etc., but with a lower `id`. Only rows that do not have matching duplicates are returned.

These examples provide different approaches to remove duplicates from an SQL query. Choose the method that suits your specific scenario and adjust the column names and table names as per your database structure.

## Grouping results from multiple queries

Here's a tutorial with examples on how to combine results from multiple queries in SQL:

### Using UNION Operator

The `UNION` operator combines the results of two or more `SELECT` statements into a single result set, removing any duplicate rows.

Example:

```sql
SELECT column1, column2, ...
FROM table1
UNION
SELECT column1, column2, ...
FROM table2;
```

In this example, the `UNION` operator combines the results of two queries, each selecting columns from different tables. The result set will contain distinct rows from both tables.

### Using UNION ALL Operator

The `UNION ALL` operator also combines the results of two or more `SELECT` statements into a single result set. However, it retains all rows, including duplicates.

Example:

```sql
SELECT column1, column2, ...
FROM table1
UNION ALL
SELECT column1, column2, ...
FROM table2;
```

In this example, the `UNION ALL` operator combines the results of two queries, including all rows from both tables, even if there are duplicates.

### Using JOIN Operation

You can use the `JOIN` operation to combine results from multiple queries based on a common column or condition.

Example:

```sql
SELECT t1.column1, t1.column2, t2.column3, ...
FROM table1 t1
JOIN table2 t2 ON t1.common_column = t2.common_column;
```

In this example, the `JOIN` operation combines results from `table1` and `table2` based on the `common_column` that exists in both tables.

### Using Subqueries

You can use subqueries to combine results from multiple queries by nesting them within the main query.

Example:

```sql
SELECT column1, column2, ...
FROM (
    SELECT column1, column2, ...
    FROM table1
    UNION
    SELECT column1, column2, ...
    FROM table2
) subquery;
```

In this example, the subqueries within parentheses retrieve results from `table1` and `table2`. The outer query then combines the results from both subqueries.

### Using CROSS JOIN

A `CROSS JOIN` operation combines all possible combinations of rows from multiple tables, resulting in a Cartesian product.

Example:

```sql
SELECT column1, column2, ...
FROM table1
CROSS JOIN table2;
```

In this example, the `CROSS JOIN` operation combines all rows from `table1` with all rows from `table2`, resulting in a combination of all possible pairs.

These examples demonstrate different methods for combining results from multiple queries in SQL. Choose the approach that suits your specific scenario and adjust the column names and table names accordingly.
