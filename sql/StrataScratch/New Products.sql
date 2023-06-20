SELECT company_name,
COUNT(CASE WHEN year = 2020 THEN product_name END) - COUNT(CASE WHEN year = 2019 THEN 
product_name END) AS net_products
FROM car_launches
WHERE year IN (2019,2020)
GROUP BY company_name
ORDER BY company_name
