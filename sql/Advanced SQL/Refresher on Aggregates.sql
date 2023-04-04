SELECT age,sum(weight)
FROM Cats
GROUP BY age
HAVING sum(weight)>12
ORDER BY age;
