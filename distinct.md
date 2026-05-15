# DISTINCT
This guide will help remove duplicate values in the result set.

> [!NOTE]
> Duplicates will be removed but NULLS will not be considered as unique.

### Sample Table

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
