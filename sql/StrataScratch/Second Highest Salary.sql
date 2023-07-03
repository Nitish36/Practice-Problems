WITH CTE AS
(
    SELECT *,ROW_NUMBER() OVER(ORDER BY salary DESC) as row_num
    FROM employee
)
SELECT salary
FROM CTE
WHERE row_num = 2
