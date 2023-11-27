SELECT c.first_name,o.order_date,
o.order_details,o.total_order_cost
FROM customers c
INNER JOIN orders o
ON c.id = o.cust_id
WHERE c.first_name = 'Jill' or c.first_name = 'Eva'
ORDER BY c.id ASC;
