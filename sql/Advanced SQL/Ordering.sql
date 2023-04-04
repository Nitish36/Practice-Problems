SELECT RANK() OVER(order by weight DESC) as ranking,weight,name
FROM Cats
ORDER BY ranking,name;
