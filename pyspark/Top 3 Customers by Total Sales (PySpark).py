"""
Mission
Using the PySpark DataFrame API, find the top 3 customers by total sales (sum of amount).

Your Task
Total each customer's sales and return only the three biggest spenders.

Example
order_id	customer_id	product_id	amount	order_date
101	1	11	1000	2024-01-01
102	1	12	1500	2024-01-03
103	2	11	800	2024-01-02
104	2	13	450	2024-01-05
105	3	12	980	2024-01-04
106	4	13	760	2024-01-06
Expected Output
customer_id	total_sales
1	2500
2	1250
3	980
"""
# sales DataFrame: order_id, customer_id, product_id, amount, order_date
# (F = pyspark.sql.functions, spark + sales are ready)
from  pyspark.sql.functions import *
# TODO: total sales per customer, top 3 by total_sales DESC
result = sales
result = result.select('customer_id','amount').withColumn('amount',result.amount.cast('int'))
result = result.groupby('customer_id').agg(sum('amount').alias('total_sales')).orderBy(desc(sum('amount')))
result = result.limit(3)
result.show()
