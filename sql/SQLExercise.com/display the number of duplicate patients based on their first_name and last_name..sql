SELECT first_name,last_name,COUNT(patient_id)
FROM patients 
group by first_name,last_name
HAVING count(patient_id)>1;
