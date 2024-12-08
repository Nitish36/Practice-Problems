WITH ThirdTransaction AS(
  SELECT customer_id,transaction_id,amount,
  ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY 
  transaction_id ASC) as rnk
  FROM purchases
)
SELECT customer_id,transaction_id,amount,(amount-0.33*amount) as 
discounted_amount
FROM ThirdTransaction
WHERE rnk = 3
