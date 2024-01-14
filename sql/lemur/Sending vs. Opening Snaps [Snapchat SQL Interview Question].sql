SELECT
  ab.age_bucket,
  ROUND((SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0  END) / SUM(a.time_spent)) * 100.0,2) AS send_time_spent,
  ROUND((SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0  END) / SUM(a.time_spent)) * 100.0,2) AS open_time_spent
FROM
  age_breakdown ab
INNER JOIN
  activities a ON ab.user_id = a.user_id
WHERE a.activity_type IN ('send', 'open') 
GROUP BY
  ab.age_bucket
ORDER BY ab.age_bucket;
