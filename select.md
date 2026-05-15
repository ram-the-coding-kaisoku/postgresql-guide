# SELECT
This section will be a quick guide on select statements.  

1. select all columns.
```sql
SELECT * FROM customer;
```
> [!NOTE]
> using * in production queries is not recommended, only for adhoc queries, select should only retrive what application needs nothing more.

2. select specific columns.
```sql
SELECT customer_id, first_name FROM customer;
```
3. select with expression.
```sql
SELECT customer_id, first_name ||' '||last_name
FROM customer;
```
- This will concatenate the columns but note the column name will be unknow, to avoid that use alias.

4. Alias
```sql
SELECT customer_id, first_name ||' '||last_name AS "Full name"
FROM customer;
```
- AS clause is optional we can simply mention the alias name, "" is needed when white spaces are included.