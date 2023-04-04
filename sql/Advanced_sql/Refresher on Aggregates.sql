/*
You will need to know aggregate functions before attempting the other questions.

We would like to find the total weight of cats grouped by age. But only return those groups with a total weight larger than 12.
*/

SELECT age,SUM(weight)
FROM Cats
GROUP BY age
HAVING SUM(weight)>12
ORDER BY age;
