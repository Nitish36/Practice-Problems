SELECT ROUND(100.0*COUNT(case_id)/(SELECT COUNT(*) FROM callers),1)
FROM callers
WHERE call_category IS NULL or call_category = 'n/a';
