SELECT customer_id,SUBSTRING_INDEX(full_name,' ',1) as first_name
FROM customers
