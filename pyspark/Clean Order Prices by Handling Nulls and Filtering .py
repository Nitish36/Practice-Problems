"""
The orders DataFrame has an order_id, a price and a discount; either amount can be NULL. Produce a cleaned DataFrame df_result:

treat a NULL price as 0 and a NULL discount as 0;
compute net_price = price - discount;
keep only rows where net_price is strictly greater than 0.
Return columns order_id and net_price, ordered by order_id, and call df_result.show(). Do not drop a row just because one of its amounts is NULL -- fill it first, then decide.

Example
orders (already defined -- do not redefine it):
order_id | price | discount
1        | 100.0 | 10.0
2        | NULL  | 5.0
3        | 50.0  | NULL
4        | 20.0  | 20.0
5        | 30.0  | 45.0
6        | 80.0  | 5.0
7        | NULL  | NULL
8        | 12.5  | 0.25
Expected Output
order_id	net_price
1	90.0
3	50.0
6	75.0
8	12.25
Order 4 nets exactly 0 and order 7 is all NULL (0 - 0), so neither is kept.
"""
from pyspark.sql.functions import col

# TODO: fill NULL price/discount with 0, compute net_price, keep net_price > 0
df_result = orders  # replace this line
df_result = df_result.fillna(0)
df_result = df_result.select("order_id","price", "discount").withColumn('Net_Price',df_result.price-df_result.discount)
df_result = df_result.select("order_id","Net_Price").filter(df_result["Net_price"]>0)

df_result.show()
