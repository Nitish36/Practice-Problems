/*
1. For data safety, only SELECT statements are allowed
2. Results have been capped at 200 rows
*/
SELECT category
FROM sales_by_film_category
ORDER BY total_sales DESC
LIMIT 3;

