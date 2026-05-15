# ORDER BY
How to sort records fetched from table, usually it will return in the order it is stored in disk.
To return the records in a specific order desc/asc `ORDER BY` clause will help.

## ORDER BY ASCENDING
Sort records in ascending order.
```sql
SELECT customer_id,first_name,last_name
from customer
order by first_name;
```
- Adding `ASC` after the column phrase in `ORDER BY` clause is optional since it sort ascending by default.

## ORDER BY DESCENDING  

Sort records in descending order.
```sql
SELECT customer_id,first_name,last_name
from customer
order by first_name DESC;
```

- Sorts the records in descending order.

## ORDER BY MULTIPLE COLUMNS

```sql
SELECT customer_id,first_name,last_name
from customer
order by first_name , last_name Desc;
```

- Basically it orders by first_name in Ascending then when a duplicate value is there then the next sort order kicks in and sorts in the next defined order.

## ORDER BY USING EXPRESSION
```sql
select customer_id, length(first_name) as len
from customer order by len desc;
```
- Sort based on the expression
