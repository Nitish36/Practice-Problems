/*the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

Year = 2022

*/
WITH total_tweets AS
(
  SELECT user_id,COUNT(tweet_id) as tweet_count
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
)
SELECT tweet_count as tweet_bucket,COUNT(user_id) as user_num
FROM total_tweets
GROUP BY tweet_bucket
