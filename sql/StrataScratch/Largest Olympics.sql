SELECT games,COUNT(DISTINCT id) as athletes_count
FROM olympics_athletes_events
GROUP BY games
ORDER BY athletes_count DESC
LIMIT 1;
