/*
List the 2 lowest paid employee from each department(department_name)
Employee - id,name,salary,department_id
Department - department_id,department_name
*/

WITH low2 AS
(
	SELECT e.id as id,e.name as name,e.salary as salary,d.department_name as dname,
	ROW_NUMBER() (PARTITION BY d.department_name ORDER BY e.salary ASC) as row_num
	FROM Employee e
	INNER JOIN Department d
	ON e.department_id = d.department_id	
)
SELECT id,name,salary
FROM low2
WHERE row_num <=2;
