SELECT P.patient_id,first_name,last_name
FROM patients P,admissions A
WHERE P.patient_id = A.patient_id AND diagnosis = 'Dementia';
