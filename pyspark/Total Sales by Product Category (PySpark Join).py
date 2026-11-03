"""
Mission
Using the PySpark DataFrame API, join sales with product on product_id and compute the total sales amount for each category, highest first.

Your Task
Join sales to product on product_id and total the amount for each category.

Example
product_id	category
11	Electronics
12	Clothing
13	Accessories
Example
order_id	customer_id	product_id	amount	order_date
1	1	11	3000	2024-01-01
2	2	11	2230	2024-01-02
3	1	12	2000	2024-01-03
4	3	12	1120	2024-01-04
5	2	13	980	2024-01-05
Expected Output
category	total_sales
Electronics	5230
Clothing	3120
Accessories	980
"""

from pyspark.sql.functions import col, sum
# TODO: join sales + product, total sales per category (highest first)
s = sales.select('product_id','amount')
p = product.select('product_id','category')

result = s.join(p,s.product_id == p.product_id,'inner')
result = result.withColumn('amount', col('amount').cast('int'))
result = result.groupBy('category').agg(sum('amount').alias('total_sales'))
result.show()
