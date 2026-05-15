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
