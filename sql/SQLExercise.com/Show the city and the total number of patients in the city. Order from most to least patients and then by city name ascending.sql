SELECT city,COUNT(patient_id) AS num_patients
FROM patients
group by city
order by num_patients DESC,city ASC;
