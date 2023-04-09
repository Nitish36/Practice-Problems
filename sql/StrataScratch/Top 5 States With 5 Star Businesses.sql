SELECT DISTINCT state,count(stars) as n_business
FROM yelp_business
WHERE stars = 5
GROUP BY state
ORDER BY n_business DESC,state asc
LIMIT 6;
