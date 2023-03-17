select D.doctor_id,concat(first_name," ",last_name) AS Full_Name,MIN(admission_date),max(admission_date)
FROM doctors D INNER JOIN admissions A ON D.doctor_id=A.attending_doctor_id
group by doctor_id
order by doctor_id ASC;
