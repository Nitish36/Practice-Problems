SELECT user_id
FROM emails e
INNER JOIN texts t
ON e.email_id = t.email_id
WHERE action_date = signup_date+INTERVAL '1 day';
