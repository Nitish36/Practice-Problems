"""
Mission
For each region, find the three customers who spent the most in total.

A customer's total is the sum of amount across all of their sales rows.

If a region has fewer than three customers, return all of them.

Tables & Schema
customers

Column	Type
customer_id	int
customer_name	string
region	string
sales

Column	Type
sale_id	int
customer_id	int
amount	int
Example
customers

customer_id	customer_name	region
1	Alice	North
2	Bob	North
3	Carol	North
4	Dan	North
5	Eve	South
6	Frank	South
7	Grace	South
8	Henry	West
9	Irene	West
sales (14 rows) — Alice 500 + 300, Bob 400 + 250, Carol 900, Dan 200 + 100, Eve 700 + 150, Frank 600, Grace 450 + 50, Henry 1000, Irene 250

Expected Output
region	customer_name	total_amount
North	Carol	900
North	Alice	800
North	Bob	650
South	Eve	850
South	Frank	600
South	Grace	500
West	Henry	1000
West	Irene	250
Explanation
North has four customers — Carol 900, Alice 800, Bob 650, Dan 300. Only the top three are returned; Dan is 4th and is dropped. This is the case that a missing filter gets wrong.

South has exactly three — Eve 850, Frank 600, Grace 500. All qualify.

West has only two — Henry 1000, Irene 250. Both are returned; there is no third row to invent.

No two customers inside a region share a total, so row_number, rank and dense_rank all give the same answer here.

Constraints
The DataFrames are created for you — do not recreate them
Build a DataFrame called df_result and finish with df_result.show()
Output columns must be exactly region, customer_name, total_amount,
ordered by region ascending then total_amount descending

Same problem in SQL: [Top 3 Customers by Region](/challenges/top-3-customers-by-region)
Production Constraints
Each region returns at most 3 customers -- fewer if the region has fewer than 3 customers, never a padded or invented row.
Ranking is by total_amount descending within each region.
Why This Matters
"Top N per group" is one of the most common analytical patterns in a data warehouse -- top products per category, top customers per region -- and getting it right specifically means not assuming every group has at least N members.
"""

# Step 1: join sales to customers and total each customer's amount.
# Step 2: rank those totals inside each region and keep the top 3.
# The DataFrames are created for you - do not recreate them.

totals = (sales.join(customers, "customer_id")
                .groupBy("region", "customer_name")
                .agg(F.sum("amount").alias("total_amount")))

w = Window.partitionBy("region")  # TODO: .orderBy(F.col("total_amount").desc())

df_result = totals  # TODO: add row_number().over(w), filter rn <= 3, then order
df_result.createOrReplaceTempView("df_result")
df = spark.sql("""
    WITH CTE AS(
    SELECT REGION,CUSTOMER_NAME,TOTAL_AMOUNT,
    RANK() OVER(PARTITION BY REGION ORDER BY TOTAL_AMOUNT DESC) as rnk
    FROM df_result
    ORDER BY REGION
    )
    SELECT REGION,CUSTOMER_NAME,TOTAL_AMOUNT
    FROM CTE
    WHERE rnk<=3
""")
df.show()
