SELECT city,property_type,AVG(bathrooms) as n_bathrooms_avg,AVG(bedrooms) as n_bedrooms_avg
FROM airbnb_search_details
GROUP by city,property_type;
