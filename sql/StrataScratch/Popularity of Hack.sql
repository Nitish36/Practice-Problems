SELECT fe.location,AVG(fhs.popularity)
FROM facebook_employees fe INNER JOIN
facebook_hack_survey fhs ON fe.id = fhs.employee_id
GROUP BY fe.location
ORDER BY fe.location ASC
LIMIT 5;
