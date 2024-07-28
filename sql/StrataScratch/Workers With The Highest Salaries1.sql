WITH CTE AS (
    SELECT t.worker_title, MAX(w.salary) AS maxsal
    FROM title t
    INNER JOIN worker w ON t.worker_ref_id = w.worker_id
    GROUP BY t.worker_title
)
SELECT t.worker_title
FROM title t
INNER JOIN CTE c ON t.worker_title = c.worker_title
ORDER BY c.maxsal DESC, t.worker_title ASC
LIMIT 2;
