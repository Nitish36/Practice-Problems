SELECT first_name,last_name,allergies
FROM patients
WHERE allergies = 'Penicillin' OR allergies = 'Morphine'
order by allergies ASC, first_name ASC,last_name ASC;
