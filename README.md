## Project's Title:
SQL: Aggregate Functions and Grouping data

## Project Description:
Theory:
Aggregate Functions: COUNT, AVG, SUM, MAX, MIN
Grouping data: GROUP BY, HAVING, GROUPING SETS

Practical tasks:
Create products_inventory table with PK which is autoincremented and the following structure (all fields are mandatory):
Product name
Available quantity
Product type 
Price without VAT
Price with VAT
Is product in stock
Warehouse (can be an id, name of city, etc - it doesnt matter)

Create scripts using aggregation functions and functions for grouping data:
Get the count of all available products in stock
Get the average product price with VAT for all categories
Get the total amount of all available items in stock (use price with VAT and available qty.)
Find the most and least expensive item from the table
Find the most expensive item in each warehouse
Get the count of all products for each category
Get the count of all products for each category in and out of stock
Get the count of all products for each category where the products count is more than 3
Get the inventory amount for each warehouse
Get all product categories stored by each warehouse
Get the avarage product categories hold by the warehouses

Acceptance criteria:
As a QA Automation trainee, I want to gain knowledge of how to use aggregate functions and count data.

## Table of Contents:
Task.txt - description of the task;
Theory.sql - theoretical examples;
PracticalTask.sql - practical task;
README.md file

## How to Install and Run the Project:
Docker needed;
PosgreSQL client needed
 
## How to Use the Project:
You need to execute the scripts in PostgreSQL client environment

## Useful links:
https://www.sqltutorial.org/sql-grouping-sets/
https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-grouping-sets/

## Add a License
no needed


