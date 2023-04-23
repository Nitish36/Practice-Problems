SELECT DISTINCT e.first_name as employee_name,e.salary as employee_salary
FROM employee e,employee m
WHERE m.id = e.manager_id AND e.salary>m.salary;
