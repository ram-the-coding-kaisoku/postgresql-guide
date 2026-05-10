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
*/

-- order by asc

SELECT 
	customer_id,first_name
FROM
	public.customer
ORDER BY 
	customer_id;

-- order by desc

SELECT 
	customer_id,first_name
FROM
	public.customer
ORDER BY 
	customer_id DESC;

-- order by multiple columns

SELECT
	customer_id,first_name,last_name
FROM	
	customer
ORDER BY 
	first_name ASC,
	last_name DESC;

-- sort rows by expression

SELECT
	customer_id,
	LENGTH(first_name) as len
FROM
	customer
ORDER BY
	len DESC
LIMIT 
	10;

	
