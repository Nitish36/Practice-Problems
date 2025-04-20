WITH Temp AS
(
  SELECT date,temperature,
  LEAD(date,1) OVER(ORDER BY date ASC) as next_day,
  LEAD(temperature,1) OVER(ORDER BY date ASC) as new_temp
  FROM temperatures
)
SELECT next_day
FROM Temp
WHERE new_temp>temperature
