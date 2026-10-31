"""
Mission
A manager wants a running total: for every day, the sum of all sales up to and including that day.

Tables & Schema
Column
order_date
sales
Example
order_date	sales
2024-06-01	100
2024-06-02	150
2024-06-03	120
2024-06-04	180
2024-06-05	200
Expected Output
order_date	sales	running_total
2024-06-01	100	100
2024-06-02	150	250
2024-06-03	120	370
2024-06-04	180	550
2024-06-05	200	750
Explanation
Row 1 has nothing before it, so its running total is just its own sales: 100.

Row 2 adds its own 150 to the 100 already accumulated, giving 250. Row 3 adds 120 to that 250, giving 370, and so on. The final row's total, 750, is the sum of all five days.

Note that every input row still appears in the output. A groupBy() would collapse them into a single row, which is why this needs a window function.
"""
# Add a running_total column: the sum of sales up to and including each row.
# Keep every row — do not group.

df_result = daily_sales  # TODO: .withColumn("running_total", ...)
df_result.createOrReplaceTempView("df_result")
df = spark.sql(
    """
    SELECT order_date,sales,SUM(sales) OVER(ORDER BY order_date) as running_total
    FROM df_result
    GROUP BY order_date,sales
    """
)
df.show()
