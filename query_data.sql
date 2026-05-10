-- QUERYING DATA
-- V 1.0
/*
This is a SQL script will help to understand querying data.
*/
----- SELECT -----
-- selecting all columns
SELECT
	*
FROM
	CUSTOMER;

-- Flow of select statement:
-- FROM -> SELECT
-- Not a best practice, only for ad-hoc, not in app or else latency will increase.
-- selecting specific columns
SELECT
	CUSTOMER_ID,
	FIRST_NAME,
	LAST_NAME
FROM
	CUSTOMER;

-- perform simple operations 
SELECT
	CUSTOMER_ID,
	FIRST_NAME || '' || LAST_NAME AS CUSTOMER_NAME
FROM
	CUSTOMER;

-- FROM is optional
SELECT
	NOW();

----- COLUMN ALIAS -----
/*
Assign a column or an expression a column alias using the syntax 
column_name AS alias_name or expression AS alias_name. 
The AS keyword is optional.

"" double quotes for white spaces.
*/
SELECT
	CUSTOMER_ID,
	FIRST_NAME "customer name"
FROM
	CUSTOMER;

-----ORDER BY-----
/*
sort rows ASC / DESC
can sort based on multiple columns
Asc is default
we can sort rows by expression and use thier alias in the ORDER BY  clause.

FROM -> SELECT -> ORDER BY
*/
-- order by asc
SELECT
	CUSTOMER_ID,
	FIRST_NAME
FROM
	PUBLIC.CUSTOMER
ORDER BY
	CUSTOMER_ID;

-- order by desc
SELECT
	CUSTOMER_ID,
	FIRST_NAME
FROM
	PUBLIC.CUSTOMER
ORDER BY
	CUSTOMER_ID DESC;

-- order by multiple columns
SELECT
	CUSTOMER_ID,
	FIRST_NAME,
	LAST_NAME
FROM
	CUSTOMER
ORDER BY
	FIRST_NAME ASC,
	LAST_NAME DESC;

-- sort rows by expression
SELECT
	CUSTOMER_ID,
	LENGTH(FIRST_NAME) AS LEN
FROM
	CUSTOMER
ORDER BY
	LEN DESC
LIMIT
	10;

-- nulls will be considered 
-- nulls first -> place nulls before values,
-- nulls last -> place nulls after values.
SELECT
	*
FROM
	SORT_DEMO
ORDER BY
	NUM NULLS FIRST;

-- order by desc defaults to nulls first to reverse that need to use nulls last
SELECT
	*
FROM
	SORT_DEMO
ORDER BY
	NUM DESC;