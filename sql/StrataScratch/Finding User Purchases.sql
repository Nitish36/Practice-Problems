SELECT DISTINCT a.user_id
FROM amazon_transactions a
INNER JOIN amazon_transactions b on a.user_id = b.user_id
AND a.id <> b.id AND a.created_at>=b.created_at
WHERE DATEDIFF(a.created_at,b.created_at)<=7
ORDER BY a.user_id ASC;
