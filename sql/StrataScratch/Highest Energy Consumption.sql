WITH topenergy AS
(
    SELECT date,SUM(consumption) AS total_energy
    FROM
    (
        SELECT date,consumption
        FROM fb_eu_energy
        UNION
        SELECT date,consumption
        FROM fb_asia_energy
        UNION
        SELECT date,consumption
        FROM fb_na_energy
    ) AS Data
    GROUP BY date
)
SELECT date,total_energy
FROM topenergy
WHERE total_energy = (SELECT MAX(total_energy) FROM topenergy)
ORDER BY date
