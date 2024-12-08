SELECT product_name,
ROUND((new_size-original_size)/original_size*100) AS size_change_percentage,
ROUND((new_price-original_price)/original_price*100) AS price_change_percentage,
CASE WHEN original_size>new_size AND 
  new_price>original_price THEN "True" ELSE "False" 
  END AS shrinkflation_flag
FROM products
ORDER BY product_name ASC
