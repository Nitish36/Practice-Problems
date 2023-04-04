SELECT name,SUM(weight) OVER(ORDER BY weight DESC ROWS between unbounded preceding and current row) as running_total_weight
FROM Cats
