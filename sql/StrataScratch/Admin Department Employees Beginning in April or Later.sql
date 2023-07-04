SELECT COUNT(worker_id) as n_admins
FROM worker
WHERE department = "Admin" and month(joining_date) NOT IN (01,02,03)
