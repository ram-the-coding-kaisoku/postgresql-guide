-- QUERYING DATA
-- V 1.0
/*
This is a SQL script will help to understand querying data.
*/

----- SELECT -----

-- selecting all columns

SELECT * FROM customer;

-- Flow of select statement:
-- FROM -> SELECT
-- Not a best practice, only for ad-hoc, not in app or else latency will increase.
-- selecting specific columns

SELECT customer_id,first_name,last_name
FROM customer;

-- perform simple operations 

SELECT customer_id,first_name||''||last_name AS Customer_Name
FROM customer;

-- FROM is optional

SELECT now();

----- COLUMN ALIAS -----

/*
Assign a column or an expression a column alias using the syntax 
column_name AS alias_name or expression AS alias_name. 
The AS keyword is optional.

"" double quotes for white spaces.
*/

SELECT customer_id,first_name "customer name"
FROM customer;