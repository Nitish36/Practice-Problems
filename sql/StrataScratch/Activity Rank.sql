SELECT from_user,COUNT(to_user) as count,RANK() OVER(ORDER BY COUNT(to_user) DESC,from_user ASC)
FROM google_gmail_emails
GROUP BY from_user
ORDER BY count DESC,from_user ASC
