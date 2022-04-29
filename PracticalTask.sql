
CREATE TABLE 
	product_inventory (
		product_id SERIAL PRIMARY KEY,
		product_name VARCHAR(255) NOT NULL,
		available_quantity INT NOT NULL,
		product_type VARCHAR(255) NOT NULL,
		price_without_VAT MONEY NOT NULL,
		price_with_VAT MONEY NOT NULL,
		is_product_in_stock BOOLEAN NOT NULL,
		warehouse VARCHAR(255) NOT NULL
		);


INSERT INTO 
 	product_inventory 	 	
 VALUES 
	(1, 'bread', 50, 'food', 1.5,  1.8, true, 'Sofia'),
	(2, 'chocolate', 150, 'food', 2,  2.12, true, 'Sliven'),
	(3, 'milk', 37, 'food', 2.2,  2.64, true, 'Karlovo'),
	(4, 'fish', 12, 'food', 5.2,  6.24, true, 'Burgas'),
	(5, 'fish', 0, 'food', 5.2,  6.24, false, 'Varna'),
	(6, 'cheese', 84, 'food', 9.8,  11.76, true, 'Burgas'),
	(7, 'cheese', 0, 'food', 9.8,  11.76, false, 'Velingrad'),
	(8, 'whater', 135, 'drink', 1,  1.25, true, 'Devin'),
	(9, 'whater', 150, 'drink', 1.2,  1.44, true, 'Velingrad'),
	(10, 'Marble Land', 49, 'wine', 27,  32.40, true, 'Ivailovgrad'),
	(11, 'Vino Reserve Ivaylovgrad', 49, 'wine', 18,  21.60, true, 'Ivailovgrad'),
	(12, 'Merlot Grand Reserve', 62, 'wine', 15,  18, true, 'Ivailovgrad'),
	(13, 'Villa Armira Merlot', 59, 'wine', 7,  8.40, true, 'Ivailovgrad'),
	(14, 'Roses Yamantievs', 0, 'wine', 12,  14.40, false, 'Sofia'),
	(15, 'Roses Yamantievs', 89, 'wine', 12,  14.40, true, 'Ivailovgrad'),
	(16, 'fresh orange', 3, 'drink', 5.2,  6.24, true, 'Sofia'),
	(17, 'apple', 67, 'fruit', 2.3,  2.76, true, 'Karlovo'),
	(18, 'strawberries', 0, 'fruit', 5.2,  6.24, false, 'Sofia'),
	(19, 'strawberries', 65, 'fruit', 5.2,  6.24, true, 'Ivailovgrad'),
	(20, 'banana', 0, 'fruit', 5.2,  6.24, false, 'Vidin');
	
	
--Get the count of all available products in stock
SELECT 
	COUNT(available_quantity)
FROM 
	product_inventory
WHERE 
	available_quantity <> 0;
	
	
--Get the count of all not available products in stock, grouped by product name
SELECT 
		COUNT(available_quantity), product_name
FROM 
	product_inventory
WHERE 
	available_quantity = 0
GROUP BY 
	product_name;


--Get the average product price with VAT for all categories
SELECT 
	AVG(price_with_VAT::numeric) AS Avg_Price_with_VAT
FROM 
	product_inventory;
	
	
--Get the total amount of all available items in stock
SELECT 
	SUM(price_with_VAT::numeric) AS total_amount
FROM 
	product_inventory
WHERE 
	available_quantity <> 0;
	
	
--Find the most and least expensive item from the table
SELECT 
	MIN(price_with_VAT::numeric) AS least_expensive_price
FROM 
	product_inventory;
	
	
SELECT 
	MAX(price_with_VAT::numeric) AS most_expensive_price
FROM 
	product_inventory;


--Find the most expensive item in each warehouse
SELECT 
	MAX(price_with_VAT::numeric), warehouse
FROM 
	product_inventory
GROUP BY 
	warehouse;
	
	
--Get the count of all products for each category
SELECT 
	COUNT(product_name), product_type
FROM 
	product_inventory
GROUP BY 
	product_type;
	
	
--Get the count of all products for each category in and out of stock
--is_product_in_stock = true
SELECT 
	COUNT(product_name), product_type
FROM 
	product_inventory
WHERE 
	is_product_in_stock = true
GROUP BY 
	product_type;


--is_product_in_stock = false
SELECT 
	COUNT(product_name), product_type
FROM 
	product_inventory
WHERE 
	is_product_in_stock = false
GROUP BY 
	product_type;
	
	
--Get the count of all products for each category where the products count is more than 3
SELECT 
	COUNT(product_name), product_type
FROM 
	product_inventory
GROUP BY 
	product_type
HAVING 
	COUNT(product_name) > 3;
	
	
--Get the inventory amount for each warehouse
SELECT 
	SUM(available_quantity), warehouse 
FROM 
	product_inventory
GROUP BY 
	warehouse;
	
	
--Get all product categories stored by each warehouse
SELECT 
	warehouse, 
	product_type
FROM 
	product_inventory
GROUP BY 
	warehouse,
	product_type
ORDER BY 
	warehouse ASC;


--Get the avarage product categories hold by the warehouses
SELECT 
	AVG(count_product_types) 
FROM
	(SELECT 
		COUNT(DISTINCT product_type) AS count_product_types
	FROM 
		product_inventory 
	GROUP BY 
		warehouse) AS AL;
	
	
--select wrehouses with counted categories
SELECT 
	warehouse,
	COUNT(DISTINCT product_type)
FROM 
	product_inventory 
GROUP BY 
	warehouse;
	
	
--count of all warehouses	
SELECT 
	COUNT(warehouse) 
FROM 
	product_inventory;
	
