-- QUERYING DATA
-- V 1.0
/*
This is a SQL script will help to understand querying data.

Flow of select statement:

FROM -> SELECT

*/

-- SELECT

-- selecting all columns
SELECT * FROM customer; 

-- Not a best practice, only for ad-hoc, not in app or else latency will increase.


-- selecting specific columns
SELECT customer_id,first_name,last_name
FROM customer;

-- perform simple operations 
SELECT customer_id,first_name||''||last_name AS Customer_Name
FROM customer;

-- FROM is optional

SELECT now();
