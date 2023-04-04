SELECT name,breed,SUM(weight) OVER(PARTITION BY breed ORDER BY name )
FROM Cats;
