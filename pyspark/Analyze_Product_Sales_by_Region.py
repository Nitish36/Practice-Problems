"""
Mission
You are given a DataFrame named sales_data that contains product sales across different regions.

Write a PySpark transformation that returns one summary row per product.

For every product, return:

product: the product name
total_qty: total quantity sold across all regions
west_qty: total quantity sold only in the West region
region_count: number of distinct regions where the product was sold
order_count: total number of orders for that product
Order the result by product in ascending order.

DataFrame: salesdata
Column	Type	Description
order_id	INT	Unique order identifier
product	STRING	Product name
region	STRING	Region where the sale happened
quantity	INT	Quantity sold
Example
order_id	product	region	quantity
1	Laptop	East	2
2	Mobile	West	5
3	Laptop	East	1
4	Tablet	North	3
5	Mobile	West	2
6	Laptop	West	4
Expected Output
product	total_qty	west_qty	region_count	order_count
Laptop	7	4	2	3
Mobile	7	7	1	2
Tablet	3	0	1	1
Explanation
For Laptop, total quantity is 2 + 1 + 4 = 7, West quantity is 4, it was sold in East and West, and it has 3 orders.

For Mobile, total quantity is 5 + 2 = 7, all sales are from West, it was sold in one region, and it has 2 orders.

For Tablet, total quantity is 3, there is no West sale so west_qty = 0, it was sold in one region, and it has 1 order.

Constraints
order_id is unique.
quantity is a positive integer.
product and region are not NULL.
A product may appear in multiple orders and multiple regions.
A product may have no sales in the West region.
Concepts Tested
groupBy
sum
count
countDistinct
Conditional aggregation with when
Sorting with orderBy
"""

# sales_data DataFrame: order_id, product, region, quantity
# F is already imported from pyspark.sql.functions.
df = sales_data.createOrReplaceTempView("sales_data")
result = spark.sql(
    """
        SELECT product,SUM(quantity) as TOTAL_QTY,
        SUM(CASE WHEN REGION='West' THEN quantity ELSE 0 END)  AS WEST_QTY,
        COUNT(DISTINCT Region) as REGION_COUNT,
        COUNT(order_id) as ORDER_COUNT
        FROM sales_data
        GROUP BY product
    """
)

result.show()
