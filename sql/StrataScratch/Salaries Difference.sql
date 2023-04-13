SELECT ABS(MAX(a.salary)-MAX(b.salary)) as sal
FROM db_employee a,db_employee b
WHERE a.department_id = 1 AND b.department_id = 4
