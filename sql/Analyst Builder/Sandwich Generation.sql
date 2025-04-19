SELECT bread_name,meat_name
FROM bread_table
JOIN meat_table
ON bread_id<=meat_id OR bread_id>=meat_id
ORDER BY bread_name,meat_name
