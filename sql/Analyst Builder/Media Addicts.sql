SELECT u.first_name
FROM users u
INNER JOIN user_time ut
ON u.user_id = ut.user_id
WHERE ut.media_time_minutes >
  (SELECT AVG(ut.media_time_minutes) FROM user_time ut)
ORDER BY u.first_name;
