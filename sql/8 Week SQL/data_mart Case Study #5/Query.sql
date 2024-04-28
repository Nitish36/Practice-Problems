SELECT * FROM weekly_sales;
DESC weekly_sales;

#-----------------------------  1. Data Cleansing Steps ------------------------------#

#1 Convert the week_date to a DATE format
ALTER TABLE weekly_sales
MODIFY week_date DATE;

#2 Add a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 
#  8th to 14th will be 2 etc
ALTER TABLE weekly_sales
ADD column week_number INT  AFTER week_date;

INSERT INTO weekly_sales (week_number) VALUES