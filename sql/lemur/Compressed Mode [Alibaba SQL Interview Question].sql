WITH occurance AS
(
  SELECT item_count,order_occurrences,RANK() OVER(ORDER BY order_occurrences DESC) as mode
  FROM items_per_order
)
SELECT item_count
FROM occurance
WHERE mode =1;
