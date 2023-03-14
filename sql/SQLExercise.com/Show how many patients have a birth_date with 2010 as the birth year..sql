select COUNT(first_name)
FROM patients
WHERE year(birth_date) = 2010;
