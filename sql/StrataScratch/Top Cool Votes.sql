WITH topcoolvotes AS
(
    SELECT business_name,review_text,cool,RANK() OVER(ORDER BY cool DESC) as rank_num
    FROM yelp_reviews
)
SELECT business_name,review_text
FROM topcoolvotes
WHERE rank_num = 1;
