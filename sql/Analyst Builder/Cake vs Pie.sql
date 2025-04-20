WITH Cake AS
(
  SELECT date_sold,product,amount_sold
  FROM desserts
  WHERE product = 'Cake'
),Pie AS(
  SELECT date_sold,product,amount_sold
  FROM desserts
  WHERE product = 'Pie'
)
SELECT C.date_sold,CASE WHEN C.amount_sold is NULL 
  THEN P.amount_sold 
  WHEN P.amount_sold IS NULL THEN C.amount_sold
  WHEN C.amount_sold IS NOT NULL AND 
  P.amount_sold IS NOT NULL THEN ABS(C.amount_sold-P.amount_sold) END
   as difference,
CASE WHEN C.amount_sold is NULL 
  THEN P.product 
  WHEN P.amount_sold IS NULL THEN C.product
  WHEN C.amount_sold>P.amount_sold THEN C.product
  WHEN C.amount_sold<P.amount_sold THEN P.product END
   as  sold_more
FROM Cake C
INNER JOIN Pie P
ON C.date_sold=P.date_sold
ORDER BY C.date_sold ASC
