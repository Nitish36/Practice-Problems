SELECT EXTRACT(YEAR FROM transaction_date),product_id,spend as curr_year_spend,
LAG(spend,1) OVER(PARTITION BY product_id) as prev_year_spend,
ROUND(((spend-LAG(spend,1) OVER(PARTITION BY product_id))/LAG(spend,1) OVER())*100,2) as yoy_rate
FROM user_transactions
