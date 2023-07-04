WITH top5 AS
(
    SELECT *, ntile(100) OVER(PARTITION BY state ORDER BY fraud_score DESC) AS row_num
    FROM fraud_score
)
SELECT policy_num, state, claim_cost, fraud_score
FROM top5
WHERE row_num <= 5;
