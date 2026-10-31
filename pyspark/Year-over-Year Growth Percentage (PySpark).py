"""
Mission
Leadership wants year-over-year growth. For each year, show the previous year's sales and the percentage change between them.

Your Task
Add the previous year's sales and the percentage change from it.

Tables & Schema
Column
sales_year
sales
Example
sales_year	sales
2021	5000
2022	6500
2023	6000
2024	7800
Expected Output
sales_year	sales	prev_year_sales	yoy_growth_pct
2021	5000	NULL	NULL
2022	6500	5000	30.0
2023	6000	6500	-7.69
2024	7800	6000	30.0
Explanation
2021 is the first year on record, so it has no previous year and its growth is NULL. 2023 sold less than 2022, so its growth is negative — that is correct, not an error.
"""
# Add prev_year_sales and yoy_growth_pct = (sales - prev) / prev * 100,
# rounded to 2 decimals. The first year has no previous year.

w = Window.orderBy("sales_year")
prev = F.lag("sales").over(w)
df_result = yearly_sales  # TODO: add both columns
df_result.createOrReplaceTempView("df_result")
df = spark.sql("""
    SELECT SALES_YEAR,SALES,
    LAG(SALES,1) OVER(ORDER BY SALES_YEAR) as prev_year_sales,
    ROUND(COALESCE((SALES-prev_year_sales)*100/prev_year_sales,NULL),2) as yoy_growth_pct
    FROM df_result
    GROUP BY SALES_YEAR,SALES
""")
df.show()
