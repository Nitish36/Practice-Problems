SELECT PN.province_name,COUNT(P.patient_id) AS patient_count
FROM patients P,province_names PN
WHERE P.province_id = PN.province_id
group by P.province_id
order by patient_count DESC;
