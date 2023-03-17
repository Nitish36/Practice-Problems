SELECT first_name,last_name,COUNT(admission_date)
FROM doctors D INNER JOIN admissions ON D.doctor_id=attending_doctor_id
group by D.doctor_id;
