SELECT (COUNT(CASE WHEN c.address IS NOT NULL THEN c.id END) / COUNT(c.id)) * 100 as percent_shippable
FROM orders o
INNER JOIN customers c ON o.cust_id = c.id;
