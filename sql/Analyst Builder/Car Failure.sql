SELECT owner_name,vehicle
FROM inspections
WHERE critical_issues = 0 AND minor_issues<=3
ORDER BY owner_name;
