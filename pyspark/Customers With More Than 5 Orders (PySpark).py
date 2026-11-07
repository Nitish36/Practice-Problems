"""
Mission
Using the PySpark DataFrame API, find the customers who have placed more than 5 orders (the DataFrame equivalent of SQL HAVING COUNT(*) > 5).

Your Task
Return only the customers who placed more than five orders.

Example
order_id	customer_id	product_id	amount	order_date
1	1	11	100	2024-01-01
2	1	11	100	2024-01-02
3	1	11	100	2024-01-03
4	1	11	100	2024-01-04
5	1	11	100	2024-01-05
6	1	11	100	2024-01-06
7	2	12	200	2024-01-01
8	2	12	200	2024-01-02
9	2	12	200	2024-01-03
10	2	12	200	2024-01-04
11	2	12	200	2024-01-05
12	2	12	200	2024-01-06
13	2	12	200	2024-01-07
14	3	13	300	2024-01-01
15	3	13	300	2024-01-02
16	3	13	300	2024-01-03
Expected Output
customer_id
1
2
"""

# sales DataFrame: order_id, customer_id, product_id, amount, order_date
from pyspark.sql import functions as F
# TODO: customers who placed MORE THAN 5 orders
result = sales
result = result.select('customer_id').groupby('customer_id').count().filter(F.col("count")>5)
order_placed = result.select('customer_id')
order_placed.show()
