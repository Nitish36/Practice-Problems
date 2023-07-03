WITH session_time_start AS
(
    SELECT user_id,date(timestamp) as date,max(timestamp) as session_start
    FROM facebook_web_log
    WHERE action = "page_load"
    group by user_id, date(timestamp)
),session_time_end AS
(
    SELECT user_id,date(timestamp) as date ,min(timestamp) as session_end
    FROM facebook_web_log
    WHERE action = "page_exit"
    group by user_id, date(timestamp)
)
SELECT a.user_id,avg(timestampdiff(second,a.session_start,b.session_end)) as avg
FROM session_time_start a
INNER JOIN session_time_end b
ON a.user_id = b.user_id AND a.date = b.date
group by a.user_id
