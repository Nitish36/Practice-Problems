SELECT COUNT(P.patient_id) as Total_Admissions
FROM patients P,admissions A
WHERE P.patient_id = A.patient_id;
