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
3. 