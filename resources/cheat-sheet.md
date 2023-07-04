# PostgreSQL Cheat Sheet

- [postgresql-cheat-sheet](https://www.postgresqltutorial.com/postgresql-cheat-sheet/)

## Database Operations

1. **Connect to a database:**

   ```shell
   psql -U <username> -d <database_name>
   ```

2. **Create a new database:**

   ```sql
   CREATE DATABASE <database_name>;
   ```

3. **Delete a database:**

   ```sql
   DROP DATABASE <database_name>;
   ```

4. **List all databases:**

   ```sql
   \l
   ```

5. **Switch to a different database:**

   ```sql
   \c <database_name>
   ```

### Table Operations:

1. **Create a table:**

   ```sql
   CREATE TABLE <table_name> (
       column1 datatype constraint,
       column2 datatype constraint,
       ...
   );
   ```

2. **Delete a table:**

   ```sql
   DROP TABLE <table_name>;
   ```

3. **List all tables:**

   ```sql
   \dt
   ```

4. **Describe a table:**

   ```sql
   \d+ <table_name>
   ```

5. **Rename a table:**

   ```sql
   ALTER TABLE <old_table_name> RENAME TO <new_table_name>;
   ```

### Data Manipulation

1. **Insert a row into a table:**

   ```sql
   INSERT INTO <table_name> (column1, column2, ...) VALUES (value1, value2, ...);
   ```

2. **Update rows in a table:**

   ```sql
   UPDATE <table_name> SET column1 = value1, column2 = value2, ... WHERE condition;
   ```

3. **Delete rows from a table:**

   ```sql
   DELETE FROM <table_name> WHERE condition;
   ```

4. **Query data from a table:**

   ```sql
   SELECT column1, column2, ... FROM <table_name> WHERE condition;
   ```

5. **Sort query results:**
   ```sql
   SELECT column1, column2, ... FROM <table_name> ORDER BY column1 ASC, column2 DESC;
   ```

### Constraints:

1. **Primary key constraint:**

   ```sql
   column_name datatype PRIMARY KEY
   ```

2. **Foreign key constraint:**

   ```sql
   column_name datatype REFERENCES other_table(column_name)
   ```

3. **Unique constraint:**

   ```sql
   column_name datatype UNIQUE
   ```

4. **Not null constraint:**

   ```sql
   column_name datatype NOT NULL
   ```

5. **Check constraint:**
   ```sql
   column_name datatype CHECK (condition)
   ```

### Indexing:

1. **Create an index:**

   ```sql
   CREATE INDEX index_name ON table_name (column1, column2, ...);
   ```

2. **Drop an index:**
   ```sql
   DROP INDEX index_name;
   ```

### Advanced Features:

1. **Join tables:**

   ```sql
   SELECT column1, column2, ...
   FROM table1
   JOIN table2 ON condition;
   ```

2. **Aggregate functions:**

   ```sql
   SELECT aggregate_function(column) FROM table;
   ```

3. **Group by clause:**

   ```sql
   SELECT column1, aggregate_function(column2)
   FROM table
   GROUP BY column1;
   ```

4. **Subqueries:**

   ```sql
   SELECT column1, column2, ...
   FROM table1
   WHERE column IN (SELECT column FROM
   table2 WHERE condition);
   ```

5. **Views:**

```sql
CREATE VIEW view_name AS SELECT column1, column2, ... FROM table WHERE condition;
```

This cheat sheet covers many commonly used PostgreSQL commands and concepts. Remember to adapt the commands to your specific use case, and consult the PostgreSQL documentation for more detailed information.
