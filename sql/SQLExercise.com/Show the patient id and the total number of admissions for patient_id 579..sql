SELECT P.patient_id,COUNT(A.admission_date)
FROM patients P,admissions A
WHERE P.patient_id = 579 and P.patient_id = A.patient_id;
