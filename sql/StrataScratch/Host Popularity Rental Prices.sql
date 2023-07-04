SELECT 
    CASE 
        WHEN number_of_reviews = 0 THEN 'New'
        WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
        WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
        WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
        WHEN number_of_reviews > 40 THEN 'Hot' 
    END AS host_popularity,
    MIN(price) AS min_price,
    AVG(price) AS avg_price,
    MAX(price) AS max_price
FROM (
SELECT DISTINCT CONCAT(price,room_type,host_since,zipcode,number_of_reviews) AS host_id,number_of_reviews,price
FROM airbnb_host_searches
) hosts
GROUP BY host_popularity;
