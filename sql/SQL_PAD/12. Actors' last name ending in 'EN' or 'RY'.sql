SELECT last_name,COUNT(actor_id)
FROM actor
WHERE last_name  LIKE '%EN' or last_name  LIKE '%RY'
GROUP BY last_name;
