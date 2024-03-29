SELECT employee_id,pay_level,salary,
CASE WHEN pay_level = 1 THEN salary+(0.1*salary)
WHEN pay_level = 2 THEN salary+(0.15*salary)
WHEN pay_level = 3 THEN salary+(2*salary)
END AS new_salary
FROM employees
GROUP BY employee_id,pay_level
