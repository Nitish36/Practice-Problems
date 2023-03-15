SELECT
  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM patients;
