SELECT p.patient_id,p.first_name,p.last_name,d.specialty
FROM patients p,admissions a,doctors d
WHERE p.patient_id = a.patient_id 
and a.attending_doctor_id = d.doctor_id 
AND a.diagnosis = 'Epilepsy' 
AND d.first_name = 'Lisa';
