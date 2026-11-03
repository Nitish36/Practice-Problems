"""
Mission
Return a DataFrame df_result with only the name and city columns, in that order.

Your Task
Return only the name and city columns, in that order.

Example
name	city	salary
Asha	Pune	50000
Ravi	Delhi	62000
Meera	Pune	58000
Expected Output
name	city
Asha	Pune
Ravi	Delhi
Meera	Pune
"""
# employees has columns: name, city, salary
df_result = employees  # TODO: keep only name and city
df_result = df_result.select('name','city')
df_result
