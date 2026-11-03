"""
Mission
Return df_result with each city and the number of employees in it, column named count. Order by city ascending.

Your Task
Return each city with the number of employees in it.

Example
name	city
Asha	Pune
Ravi	Delhi
Meera	Pune
Expected Output
city	count
Delhi	1
Pune	2
"""
df_result = employees  # TODO: groupBy city, count, order by city
df_result = df_result.groupBy('city').count().orderBy('city',ascending=True)
df_result.select('city','count')
df_result
