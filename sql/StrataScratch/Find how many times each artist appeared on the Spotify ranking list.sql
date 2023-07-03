SELECT artist,COUNT(artist) as n_occurances
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY n_occurances DESC
