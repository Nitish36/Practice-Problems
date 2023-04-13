SELECT t.worker_title
FROM worker w
INNER JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (SELECT MAX(w.salary) FROM worker w);
