SELECT DENSE_RANK() OVER(ORDER BY age DESC) AS r,name,age
FROM Cats
ORDER BY r,name
