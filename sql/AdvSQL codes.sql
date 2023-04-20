CREATE DATABASE ADVSQL;
USE ADVSQL;
CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);
INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
COMMIT;

SELECT * FROM product;
-- First_Value : fetches the first value from a given partition
-- Write a query to display the most expensive product under each category
SELECT *,first_value(product_name) OVER(PARTITION BY product_category ORDER BY price DESC) AS ExpensiveProduct
FROM product;

-- WRITE a query to display the most least expensive product under each category
-- Output the table by displaying brand and corresponding least expensive product
SELECT brand,price,first_value(product_name) OVER(PARTITION BY product_category ORDER BY price ASC)
FROM product;

-- Last value : fetch last value or record from the partition
SELECT product_category,brand,price,last_value(product_name) OVER(PARTITION BY product_category ORDER BY price DESC)
FROM product;

-- Frame Clause: subset of partition. Range between unbounded preceding and current row

SELECT *,
first_value(product_name) OVER(PARTITION BY product_category ORDER BY PRICE DESC) as most_exp_product,
last_value(product_name) OVER(PARTITION BY product_category order by price DESC
range between unbounded preceding and unbounded following)
as least_exp_product
FROM product;

-- range and row : rows considers exact rows range if current row as duplicate rows range wiill consider the last row with the price
-- range between 2 preceding and 2 following means 2 rows preceding curr row and 2 rows following curr row

-- Nth values
-- Nth value(column to be displayed,column to be fetched)
-- Write query to display the second most expensive product under each category
SELECT *,nth_value(product_name,7) 
OVER(partition by product_category order by price DESC
range between unbounded preceding and unbounded following ) as second_most_expensive
FROM product;

-- Ntile groiup set of data in partition and place in bucket
-- Ntile(no_of_buckets)
-- Write a query to segregate all the expensive phones, mid range phones and cheaperphones
SELECT product_name,
CASE WHEN x.buckets = 1 then 'Expensive'
	WHEN x.buckets = 2 then 'Mid range'
    WHEN x.buckets = 3 then 'Cheaper Phone' END phone_category
from (
SELECT *, ntile(3) OVER(ORDER BY price DESC) as buckets
FROM product
WHERE product_category = 'Phone') x;


-- Questions
-- 1) Find the most expensive product_name where category is phone and brand is Samsung and product_category is phone
SELECT product_category,price,FIRST_VALUE(product_name) OVER(ORDER BY price DESC) as Most_Expensive_Product
FROM product
WHERE brand = "Samsung" and product_category = "Phone";
-- 2) Find the least expensive product_name where category Smartwatch
SELECT product_category,price,last_value(product_name) OVER(ORDER BY price DESC) as Least_Expensive
FROM product;
-- 3) Find the most and least expensive product where category is phone and laptop
SELECT *,
first_value(product_name) OVER(partition by product_category ORDER BY price DESC) as Most_Expensive_Product,
last_value(product_name) OVER(partition by product_category order by price desc 	
RANGE between unbounded preceding and unbounded following) as Least_Expensive_Product
FROM product;