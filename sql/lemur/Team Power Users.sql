/*
Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of 
these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption:

No two users has sent the same number of messages in August 2022.

*/

with cte as (
select sender_id, count(message_id) as count_messages
from Messages
Where date(sent_date) between '2022-08-01' and '2022-08-31'
group by sender_id),
cte2 as(
select *, dense_rank() over (order by count_messages desc) as rnk
from cte)
select sender_id, count_messages from cte2 where rnk <=2;
