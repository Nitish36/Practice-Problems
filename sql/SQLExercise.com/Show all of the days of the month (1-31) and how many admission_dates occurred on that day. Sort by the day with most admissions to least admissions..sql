SELECT day(admission_date) as day_number,COUNT(admission_date)
FROM admissions
group by day_number
order by COUNT(admission_date) DESC;
