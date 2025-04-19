SELECT ROUND(AVG(bike_price),2) as avg_sales_price
FROM inventory
WHERE bike_sold = 'Y' and bike_price IS NOT NULL;
