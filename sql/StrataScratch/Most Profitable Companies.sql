SELECT company,SUM(profits) OVER(PARTITION BY company ORDER BY profits) as profit
FROM forbes_global_2010_2014
ORDER BY profits DESC
LIMIT 3;
