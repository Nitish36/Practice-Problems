SELECT P.first_name,P.last_name,'Patient' AS role
FROM patients P
UNION ALL
SELECT D.first_name,D.last_name,'Doctor' AS role
FROM doctors D;
