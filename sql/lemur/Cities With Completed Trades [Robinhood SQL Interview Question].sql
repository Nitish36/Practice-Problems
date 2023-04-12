select u.city, count(*)as total_order
from users u
JOIN trades t
on u.user_id = t.user_id
where status='Completed'
GROUP BY city
having count(*)>1
order by total_order desc
limit 3;
