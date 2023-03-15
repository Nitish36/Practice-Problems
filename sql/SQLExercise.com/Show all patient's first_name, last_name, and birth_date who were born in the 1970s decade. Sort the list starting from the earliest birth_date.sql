SELECT first_name,last_name,birth_date
FROM patients
WHERE year(birth_date) >=1970 and year(birth_date)<=1979
order by birth_date ASC;
