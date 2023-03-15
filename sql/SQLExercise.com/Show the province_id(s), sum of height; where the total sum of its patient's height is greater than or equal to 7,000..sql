select province_id,sum(height)
FROM patients 
group by province_id
having SUM(height)>=7000;
