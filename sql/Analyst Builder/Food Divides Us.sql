WITH high_region AS
(
  SELECT region,SUM(fast_food_millions) as millions
  FROM food_regions
  GROUP BY region
  ORDER BY millions DESC
  LIMIT 1
)
SELECT region
FROM high_region
