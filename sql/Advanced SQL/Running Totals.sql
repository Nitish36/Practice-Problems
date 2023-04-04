SELECT name,SUM(weight) OVER(ORDER BY name) as running_total_weight
FROM Cats;
