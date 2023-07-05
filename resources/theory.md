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
