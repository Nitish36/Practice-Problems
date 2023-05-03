WITH cte1 as
(
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'sent'
),
 cte2 as
(
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'accepted'
)
SELECT cte1.date,
COUNT(cte2.user_id_receiver)/COUNT(cte1.user_id_sender) as percentage_acceptance
FROM cte1
LEFT JOIN cte2
ON cte1.user_id_sender = cte2.user_id_sender AND cte1.user_id_receiver = cte2.user_id_receiver
GROUP BY date;
