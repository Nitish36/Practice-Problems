SELECT type,
COUNT(CASE WHEN processed = 1 THEN 1 END)/COUNT(*) as processed_rate
FROM facebook_complaints
GROUP BY type
