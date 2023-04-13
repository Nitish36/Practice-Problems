SELECT ah.nationality,COUNT(DISTINCT au.unit_id) as apartment_count
FROM airbnb_hosts ah INNER JOIN airbnb_units au
ON ah.host_id = au.host_id
WHERE ah.age<30 AND au.unit_type = "Apartment"
GROUP BY ah.nationality
ORDER BY apartment_count DESC;
