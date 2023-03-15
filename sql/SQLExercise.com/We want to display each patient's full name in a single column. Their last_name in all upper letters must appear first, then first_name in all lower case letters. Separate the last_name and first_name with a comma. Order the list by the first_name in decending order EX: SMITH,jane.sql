SELECT concat(UPPER(last_name),',',lower(first_name))
FROM patients
order by first_name DESC;
