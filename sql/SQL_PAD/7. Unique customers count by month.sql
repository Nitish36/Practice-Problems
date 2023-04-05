SELECT EXTRACT(YEAR FROM rental_ts) as year,EXTRACT(MONTH FROM rental_ts) as mon,COUNT(DISTINCT customer_id) as uu_cnt
FROM rental
GROUP BY year,mon
ORDER BY year,mon;
