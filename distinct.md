# DISTINCT
This guide will help remove duplicate values in the result set.

> [!NOTE]
> Duplicates will be removed but NULLS will not be considered as unique.

### Sample Table

Create a sample table.

```SQL
CREATE TABLE colors(
  id SERIAL PRIMARY KEY,
  bcolor VARCHAR,
  fcolor VARCHAR
);

INSERT INTO
  colors (bcolor, fcolor)
VALUES
  ('red', 'red'),
  ('red', 'red'),
  ('red', NULL),
  (NULL, 'red'),
  (NULL, NULL),
  ('green', 'green'),
  ('blue', 'blue'),
  ('blue', 'blue');
```


## DISTINCT using single column

```SQL
SELECT
 DISTINCT bcolor
FROM
  colors;
```
- Only give unique values of the columns

## DISTINCT using multiple columns

```SQL
SELECT
 DISTINCT bcolor,fcolor
FROM
  colors;
```

- If multiple columns were given it will fetch based on the combination of the mentioned columns.

# DISTINCT ON

- Need for `DISTINCT ON` simply groups the duplicate and returns only the first occurent which is determined by the order by where `DISTINCT` simply removes duplicate records based on the column.

> [!NOTE]
> We can use `ORDER BY` in the `DISTINCT ON` to order the groups.

```SQL

select * from mark;

/*
"ram"	50
"sri"	50
"ram"	70
"ram"	90
"sri"	50
"ram"	70
*/

select distinct name, mark
from mark;

/*
"ram"	50
"sri"	50
"ram"	90
"ram"	70
*/

select distinct on (name,mark) name,
mark
from mark;
```


