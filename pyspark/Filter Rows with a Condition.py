"""
Mission
Return only the employees with salary greater than 55000. Keep all columns.

Example
name	city	salary
Asha	Pune	50000
Ravi	Delhi	62000
Meera	Pune	58000
Expected Output
name	city	salary
Ravi	Delhi	62000
Meera	Pune	58000
"""
from pyspark.sql.functions import col
df_result = employees  # TODO: filter salary > 55000
df_result = df_result.filter(df_result.salary>55000)
df_result = df_result.select('name','city','salary')
df_result
