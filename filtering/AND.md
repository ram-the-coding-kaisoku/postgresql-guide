# AND
- `AND` is boolean operator used to filter based on the boolean conditions
- A boolean expression results `t` or `f` or `null`

|expression1|expression2|result|
|---|---|---|
|t|t|t|
|t|f|f|
|f|f|f|
|t|n|n|
|f|n|f|
|n|n|n|

```SQL
select title,rating,length
from film
where length > 90 and rating='PG-13'
```

- When the condition of both to be satisified `AND` will filter.