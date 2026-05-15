# SELECT
This section will be a quick guide on select statements.  

![from_select_flow](imgs/from_select.png)


## select all columns.
```sql
SELECT * FROM customer;
```
> [!CAUTION]
> using * in production queries is not recommended, only for adhoc queries, select should only retrive what application needs nothing more.

## select specific columns.
```sql
SELECT customer_id, first_name FROM customer;
```
## select with expression.
```sql
SELECT customer_id, first_name ||' '||last_name
FROM customer;
```
- This will concatenate the columns but note the column name will be unknow, to avoid that use alias.

## Alias
```sql
SELECT customer_id, first_name ||' '||last_name AS "Full name"
FROM customer;
```
- AS clause is optional we can simply mention the alias name, "" is needed when white spaces are included.

## Without FROM clause.
```sql
SELECT now();
```
- FROM clause is optional.