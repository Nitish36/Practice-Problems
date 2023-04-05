SELECT last_name,COUNT(actor_id)
FROM actor
WHERE last_name IN ('DAVIS','BRODY','ALLEN','BERRY')
GROUP BY last_name;
