SELECT product_id,SUM(cost_in_dollars*units_sold) as revenue
FROM online_orders
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5
