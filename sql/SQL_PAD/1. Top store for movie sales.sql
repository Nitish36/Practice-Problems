/*
1. For data safety, only SELECT statements are allowed
2. Results have been capped at 200 rows
*/
SELECT store,manager
FROM sales_by_store
ORDER BY total_sales DESC
LIMIT 1;
