--Theory:

--Aggregate Functions: COUNT, AVG, SUM, MAX, MIN
 --AVG() – returns the average of a set.
SELECT 
	AVG(column_name)
FROM 
	table_name
WHERE 
	condition;

SELECT 
	AVG(Price)
FROM 
	Products;

 
 --COUNT() – returns the number of items in a set.
SELECT 
	COUNT(column_name)
FROM 
	table_name
WHERE 
	condition;

SELECT 	
	COUNT(ProductID)
FROM 
	Products;


 --MAX() – returns the maximum value in a set.
SELECT 
	MAX(column_name)
FROM 
	table_name
WHERE 
	condition;

SELECT 
	MAX(Price) AS LargestPrice
FROM 
	Products;
 
 
 --MIN() – returns the minimum value in a set
SELECT 
	MIN(column_name)
FROM 
	table_name
WHERE 
	condition;

SELECT 
	MIN(Price) AS SmallestPrice
FROM 
	Products;
 
  
 --SUM() – returns the sum of all or distinct values in a set
SELECT 
	SUM(column_name)
FROM 
	table_name
WHERE 
	condition;

SELECT 
	SUM(Quantity)
FROM 
	OrderDetails;


--GROUPING SETS
SELECT
    aggregate_function(column_1)
    column_2,
    column_3,
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (column_2, column_3),
        (column_2),
        (column_3),
        ()
);

SELECT
  SUM(payment_amount),
  YEAR(payment_date) AS 'Payment Year',
  store_id AS 'Store'
FROM payment_new
GROUP BY GROUPING SETS (YEAR(payment_date), store_id)
ORDER BY YEAR(payment_date), store_id;


--Grouping data: GROUP BY, HAVING 
--GROUP BY
SELECT
	column1,
	column2,
	AGGREGATE_FUNCTION (column3)
FROM
	table1
GROUP BY
	column1,
	column2;

SELECT 
	column_name(s)
FROM
	table_name
WHERE 
	condition
GROUP BY 
	column_name(s)
ORDER BY 
	column_name(s);

SELECT 
	COUNT(CustomerID), Country
FROM 
	Customers
GROUP BY 
	Country;

SELECT 
	COUNT(address_id), city
FROM 	
	customer_address
GROUP BY 
	city;

SELECT 
	column-list
FROM 
	table_name
WHERE 
	[ conditions ]
GROUP BY 
	column1, column2....columnN
ORDER BY 
	column1, column2....columnN


--HAVING
SELECT 
	column_name(s)
FROM 
	table_name
WHERE 
	condition
GROUP BY 
	column_name(s)
HAVING 
	condition
ORDER BY 
	column_name(s);

SELECT 
	COUNT(CustomerID), Country
FROM 
	Customers
GROUP BY 
	Country
HAVING 
	COUNT(CustomerID) > 5;

SELECT 
	COUNT(CustomerID), Country
FROM 
	Customers
GROUP BY 
	Country
HAVING 
	COUNT(CustomerID) > 5
ORDER BY 
	COUNT(CustomerID) DESC;







