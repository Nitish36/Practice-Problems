SELECT 
COUNT(CASE WHEN status = "open" THEN 1 END)/COUNT(user_id) as active_users_share
FROM fb_active_users
WHERE country = "USA"
