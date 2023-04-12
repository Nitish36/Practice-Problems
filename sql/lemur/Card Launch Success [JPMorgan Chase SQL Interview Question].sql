WITH top2 AS
(
  SELECT card_name,issued_amount,ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issued_amount ASC) as row_num
  FROM monthly_cards_issued
)
SELECT card_name,issued_amount
FROM top2
WHERE row_num = 1
ORDER BY card_name DESC;
