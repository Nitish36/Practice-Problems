SELECT m.employee_id,m.position,COUNT(e.employee_id) as cnt_of_direct_reports
FROM direct_reports e
INNER JOIN direct_reports m
ON e.managers_id = m.employee_id
WHERE m.position LIKE '%Manager%'
GROUP BY m.employee_id,m.position
