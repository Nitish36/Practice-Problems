SELECT DISTINCT city
FROM patients
WHERE city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%'
ORDER BY city ASC;
