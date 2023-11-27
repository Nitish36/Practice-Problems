SELECT video_id,COUNT(DISTINCT concat(IFNULL(user_firstname, ''), IFNULL(user_lastname, ''))) as num_unique_users
FROM user_flags
WHERE flag_id is not null
GROUP BY video_id
ORDER BY num_unique_users ASC;
