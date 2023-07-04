Yes, you can write a `.sql` file containing SQL statements and execute it using `psql`. This allows you to run multiple SQL statements in a batch. Here's how you can do it:

1. Create a new text file and give it a `.sql` extension, such as `script.sql`.

2. Open the `.sql` file using a text editor and write your SQL statements in it. For example:

```sql
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT
);

INSERT INTO departments (id, name) VALUES (1, 'Sales');
INSERT INTO departments (id, name) VALUES (2, 'Marketing');
```

3. Save the `.sql` file.

4. Open a terminal or command prompt and navigate to the directory where the `.sql` file is located.

5. Execute the SQL statements in the `.sql` file using `psql` by running the following command:

```bash
psql -d your_database_name -U your_username -f script.sql
```

Replace `your_database_name` with the name of the database where you want to execute the SQL statements, and `your_username` with your PostgreSQL username.

The `-d` option specifies the database name, `-U` option specifies the username, and the `-f` option indicates that the file contains the SQL statements to be executed.

Executing the `psql` command will connect to the specified database, read the SQL statements from the `.sql` file, and execute them in sequence. You will see the output and any error messages directly in the terminal or command prompt.

Make sure to adjust the file name, database name, and username according to your specific setup.
