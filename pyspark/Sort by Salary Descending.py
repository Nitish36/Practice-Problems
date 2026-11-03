"""
Mission
Return df_result sorted by salary from highest to lowest.

Your Task
Return the rows sorted by salary from highest to lowest.

Example
name	salary
Asha	50000
Ravi	62000
Meera	58000
Expected Output
name	salary
Ravi	62000
Meera	58000
Asha	50000
"""

from pyspark.sql.functions import *
df_result = employees  # TODO: sort salary desc
df_result = df_result.orderBy(desc('Salary'))
df_result.show()
