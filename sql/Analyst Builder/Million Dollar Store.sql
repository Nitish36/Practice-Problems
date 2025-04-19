SELECT store_id, ROUND(AVG(revenue),2) as avg_yearly_revenue
FROM stores
GROUP BY store_id
HAVING AVG(revenue)>1000000
