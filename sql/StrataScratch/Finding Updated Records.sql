SELECT DISTINCT id,first_name,last_name,department_id,MAX(salary) OVER(PARTITION BY id)
FROM ms_employee_salary
ORDER BY id ASC;
