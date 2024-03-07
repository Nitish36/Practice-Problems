WITH high AS(
SELECT city,COUNT(amenities) as amenities_count
,RANK() OVER(ORDER BY COUNT(amenities) DESC) as rnk
FROM airbnb_search_details
GROUP BY city
)
SELECT city
FROM high
WHERE rnk = 1
