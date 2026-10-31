"""
Mission
Each product needs its own running total. The total must restart at every new product rather than carrying over from the previous one.

Your Task
Add a running total of sales that restarts at each new product.

Tables & Schema
Column
order_date
product
sales
Example
order_date	product	sales
2024-06-01	A	100
2024-06-02	A	150
2024-06-03	A	200
2024-06-04	B	120
2024-06-05	B	180
Expected Output
order_date	product	sales	cumulative_sales
2024-06-01	A	100	100
2024-06-02	A	150	250
2024-06-03	A	200	450
2024-06-04	B	120	120
2024-06-05	B	180	300
Explanation
The running total restarts for each product rather than carrying across.

Product A accumulates 100, then 250, then 450. Product B's first row starts again from its own 120 — it does not continue from A's 450 — and then reaches 300.

That restart is what partitionBy(\"product\") does. Without it you would get one continuous total running through both products.

Constraints
The DataFrame is created for you — do not recreate it
Build a DataFrame called df_result and finish with df_result.show()
Same problem in SQL: [Cumulative Sales per Product](/challenges/cumulative-sales-per-product)
Success Criteria
Your DataFrame has order_date, product, sales and cumulative_sales.
The total restarts for each product; product B's first row is its own sales, not a continuation of A's.
Every input row is still present.
Rows come back ordered by product, then order_date.
You finish by calling .show() on the result, which is what the grader reads.
"""
# Add cumulative_sales: a running total that RESTARTS for each product.
# Order the output by product, then order_date.
from pyspark.sql.functions import *
#w = Window.orderBy("order_date")  # TODO: add .partitionBy("product") and .rowsBetween(...)
df_result = product_sales  # TODO: withColumn + orderBy
df_result.createOrReplaceTempView("df_result")
df = spark.sql("""
    SELECT ORDER_DATE,PRODUCT,SALES,
    SUM(SALES) OVER(PARTITION BY PRODUCT ORDER BY SALES ASC) as cumulative_sales
    FROM df_result
"""
)
df.show()
