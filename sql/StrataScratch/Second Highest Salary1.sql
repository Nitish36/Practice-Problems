SELECT MAX(salary) as salary
FROM employee 
WHERE salary < (SELECT MAX(salary) FROM employee)
