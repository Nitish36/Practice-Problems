SELECT concat(P.first_name," ",P.last_name),A.diagnosis,concat(D.first_name," ",D.last_name)
FROM patients P,admissions A,doctors D
WHERE P.patient_id = A.patient_id AND A.attending_doctor_id = d.doctor_id;
