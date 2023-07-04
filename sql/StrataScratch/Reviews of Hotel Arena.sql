SELECT hotel_name,reviewer_score,COUNT(*)
FROM hotel_reviews
WHERE hotel_name = "Hotel Arena"
GROUP BY reviewer_score
ORDER BY COUNT(lat) DESC
