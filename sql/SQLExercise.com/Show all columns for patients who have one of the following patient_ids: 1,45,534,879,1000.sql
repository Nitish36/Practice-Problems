SELECT * from patients
WHERE patient_id=1 or patient_id=45 OR patient_id=534 or patient_id=879 or patient_id=1000;

ALT Soln

SELECT *
FROM patients
WHERE
  patient_id IN (1, 45, 534, 879, 1000);
