WITH CTE as
(
    SELECT department,first_name,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as row_num
    FROM employee
)
SELECT department,first_name,salary
FROM CTE
WHERE row_num = 1
ORDER BY salary DESC;
