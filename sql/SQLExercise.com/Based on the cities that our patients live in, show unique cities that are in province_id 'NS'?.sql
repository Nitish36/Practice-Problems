SELECT distinct P.city
FROM patients P,province_names PN
WHERE P.province_id = 'NS' and P.province_id = PN.province_id;
