SELECT name,weight,AVG(weight) OVER(ORDER BY weight ROWS BETWEEN 1 preceding and 1 following) AS average_weight
FROM Cats
