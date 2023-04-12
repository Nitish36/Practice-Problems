WITH thirdtransac AS
(
    SELECT user_id,spend,transaction_date,ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) as row_num
    FROM transactions
)
SELECT user_id,spend,transaction_date
FROM thirdtransac
WHERE row_num = 3;
