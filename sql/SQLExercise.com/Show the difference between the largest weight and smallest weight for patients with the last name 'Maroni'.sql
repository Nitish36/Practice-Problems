SELECT MAX(weight)-MIN(weight) AS DiffHeight
FROM patients
WHERE last_name = 'Maroni';
