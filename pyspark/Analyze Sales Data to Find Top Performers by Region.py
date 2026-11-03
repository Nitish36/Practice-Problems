"""
Mission
Given a sales_data table that contains information about sales transactions across various regions, your task is to identify the top 2 salespersons per region based on the total sales amount. The table might contain duplicate transactions due to report generation errors. You need to ensure that duplicates are handled correctly and that only the top 2 salespersons by total sales amount are returned for each region.

Your Task
Remove the duplicated transactions, total each salesperson's sales within their region, and return the top two per region.

Example
region	salesperson	sales_amount
North	Alice	300
North	Alice	300
North	Bob	500
North	Charlie	200
South	David	700
South	Eve	600
South	Eve	600
South	Frank	300
Expected Output
region	salesperson	total_sales
North	Bob	500
North	Alice	300
South	David	700
South	Eve	600
"""

from pyspark.sql.functions import sum, row_number
from pyspark.sql.window import Window

# TODO: Implement logic to find top 2 salespersons by sales amount per region
df = sales_data
df.createOrReplaceTempView("sales_view")
top_salespersons = spark.sql(
    """
    WITH CTE AS(
        SELECT region,salesperson,sales_amount as TOTAL_SALES, RANK() OVER(PARTITION BY region ORDER BY sales_amount DESC) as rnk
        FROM sales_view
    )
    SELECT DISTINCT region,salesperson,TOTAL_SALES FROM CTE
    WHERE rnk in (1,2)
    ORDER BY REGION ASC, TOTAL_SALES DESC
    """
)  # replace this line
top_salespersons.show()
