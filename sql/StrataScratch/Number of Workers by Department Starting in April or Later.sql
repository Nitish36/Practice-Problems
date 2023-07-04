SELECT department,COUNT(worker_id) as num_workers
FROM worker
WHERE month(joining_date) NOT IN (01,02,03)
GROUP BY department
ORDER BY num_workers DESC
