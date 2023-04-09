SELECT name,SUM(review_count) OVER(PARTITION BY name) as review_count
FROM yelp_business
ORDER BY review_count DESC
LIMIT 5;
