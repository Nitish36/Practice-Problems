SELECT first_name,target
FROM salesforce_employees
WHERE manager_id = 13
ORDER BY target DESC
LIMIT 3
