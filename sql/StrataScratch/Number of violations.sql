SELECT EXTRACT(YEAR FROM inspection_date) as year,COUNT(violation_id) as n_inspection
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY year
ORDER BY year asc;
