WITH top10 AS
(
    SELECT DISTINCT year_rank,group_name,song_name,RANK() OVER(PARTITION BY group_name) as row_num
    FROM billboard_top_100_year_end
    WHERE year = 2010
    ORDER BY year_rank
) 
SELECT year_rank as rank,group_name,song_name
FROM top10
WHERE row_num = 1
LIMIT 10;
