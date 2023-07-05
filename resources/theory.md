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
