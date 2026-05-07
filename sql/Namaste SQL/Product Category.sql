"""
You are provided with a table named Products containing information about various products, including their names and prices. Write a SQL query to count number of products in each category based on its price into three categories below. Display the output in descending order of no of products.

 

1- "Low Price" for products with a price less than 100
2- "Medium Price" for products with a price between 100 and 500 (inclusive)
3- "High Price" for products with a price greater than 500.
Tables: Products
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| product_id   | int         |
| product_name | varchar(20) |
| price        | int         |
+--------------+-------------+
"""

WITH PriceIndicator AS(
  SELECT product_id,price,
  CASE WHEN price < 100 THEN "Low Price"
  WHEN price >= 100 AND price <=500 THEN "Medium Price"
  ELSE "High Price"
  END AS PI
  FROM Products
)
SELECT PI,COUNT(product_id) as no_of_products 
FROM PriceIndicator
GROUP BY PI
ORDER BY no_of_products DESC;
