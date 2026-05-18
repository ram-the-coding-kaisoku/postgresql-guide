# Where
- used to filter rows based on condtion

![where order](../imgs/from_where_select_order.png)

## SYNTAX
```SQL
SELECT
  select_list
FROM
  table_name
WHERE
  condition
ORDER BY
  sort_expression;
```

### Operations

| Operator | Description |
| --- | --- |
| = | Equals | 
| > | Greater than |
| >= | Greater than or equal to |
| < | Lesser than |
| <= | Lesser than or equal to|
| != | Not equal to|

```SQL
-- EQUALS TO 
select amount,customer_id
from payment 
where amount = 7.99;

-- GREATER THAN 
select amount,customer_id
from payment 
where amount > 7.99;

-- GREATER THAN OR EQUAL TO
select amount,customer_id
from payment 
where amount >= 7.99;

-- LESSER THAN 
select amount,customer_id
from payment 
where amount < 7.99;

-- LESSER THAN OR EQUAL TO
select amount,customer_id
from payment 
where amount <= 7.99;

-- NOT EQUAL TO
select amount,customer_id
from payment 
where amount != 7.99;
```

- We can use other operations as well with `WHERE` clause.