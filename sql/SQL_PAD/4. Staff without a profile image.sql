/*
1. For data safety, only SELECT statements are allowed
2. Results have been capped at 200 rows
*/
SELECT first_name,last_name
FROM staff
WHERE picture IS NULL;
