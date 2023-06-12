SELECT DISTINCT home_library_code
FROM library_usage
WHERE notice_preference_definition = "email" 
and circulation_active_year = 2016
and provided_email_address = 0
LIMIT 5;
