SELECT patient_id,diagnosis
FROM admissions 
group by patient_id,diagnosis
HAVING COUNT(diagnosis)>1;
