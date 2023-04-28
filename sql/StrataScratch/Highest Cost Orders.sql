SELECT c.first_name,SUM(o.total_order_cost) as total_order_cost,o.order_date
FROM customers c
INNER JOIN orders o ON c.id = o.cust_id
WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY o.order_date,c.first_name
ORDER BY total_order_cost DESC
LIMIT 1;
