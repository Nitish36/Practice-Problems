SELECT  ROW_NUMBER() OVER(ORDER by color,name) AS unique_number,name ,color
FROM Cats
