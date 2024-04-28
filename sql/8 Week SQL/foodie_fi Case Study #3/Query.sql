SELECT * FROM plans;
SELECT * FROM subscriptions;

#--------------------- A. Customer Journey ---------------------#
#1 How many customers has Foodie-Fi ever had?
SELECT COUNT(DISTINCT customer_id) as customer_count
FROM subscriptions;

#2 What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
SELECT CASE WHEN MONTH(s.start_date) = 1 THEN 'January'
WHEN MONTH(s.start_date) = 2 THEN 'February'
WHEN MONTH(s.start_date) = 3 THEN 'March'
WHEN MONTH(s.start_date) = 4 THEN 'April'
WHEN MONTH(s.start_date) = 5 THEN 'May'
WHEN MONTH(s.start_date) = 6 THEN 'June'
WHEN MONTH(s.start_date) = 7 THEN 'July'
WHEN MONTH(s.start_date) = 8 THEN 'August'
WHEN MONTH(s.start_date) = 9 THEN 'September'
WHEN MONTH(s.start_date) = 10 THEN 'October'
WHEN MONTH(s.start_date) = 11 THEN 'November'
WHEN MONTH(s.start_date) = 12 THEN 'December' END as monthly,
COUNT(p.plan_name) as plan_count
FROM plans p
INNER JOIN subscriptions s
ON p.plan_id = s.plan_id
WHERE p.plan_name = 'trial'
GROUP BY monthly
ORDER BY plan_count DESC;

#3 What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
SELECT p.plan_id,p.plan_name,COUNT(p.plan_id) as plan_count
FROM plans p
INNER JOIN subscriptions s
ON p.plan_id = s.plan_id
WHERE year(s.start_date)>2020
GROUP BY p.plan_id,p.plan_name
ORDER BY plan_count;

#4 What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
SELECT COUNT(CASE WHEN p.plan_name = 'churn' THEN 1 END ) AS customer_count,
ROUND((CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(DISTINCT customer_id) FROM  subscriptions)) * 100, 1) as percent
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id
WHERE p.plan_id = 4;

#5 How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
WITH churn AS
(
	SELECT s.customer_id,s.plan_id,p.plan_name,LEAD(p.plan_name) OVER(PARTITION BY s.customer_id) as lead_plan
    FROM subscriptions s
    INNER JOIN plans p
    ON s.plan_id = p.plan_id
    ORDER BY customer_id
)
SELECT COUNT(customer_id) as churn_count, ROUND(COUNT(*) * 100 / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions), 0) AS percentage_churn
FROM churn
WHERE plan_name = 'trial' and lead_plan = 'churn';


#8 How many customers have upgraded to an annual plan in 2020?
SELECT COUNT(s.customer_id) as annual_customer_count
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id
WHERE p.plan_name = 'pro annual' and year(s.start_date) = 2020;

#9 How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
WITH day_count AS(
SELECT s.customer_id,s.plan_id,p.plan_name,LEAD(p.plan_name) OVER(PARTITION BY s.customer_id) as lead_plan,
s.start_date,LEAD(s.start_date) OVER(PARTITION BY s.customer_id) as lead_date
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id
ORDER BY customer_id
)
SELECT customer_id,plan_name,lead_plan,datediff(lead_date,start_date) as number_of_days
FROM day_count
WHERE lead_plan LIKE '%annual%'
ORDER BY customer_id;

#11 How many customers downgraded from a pro monthly to a basic monthly plan in 2020?
WITH downgrade AS(
SELECT s.customer_id,s.plan_id,p.plan_name,LEAD(p.plan_name) OVER(PARTITION BY s.customer_id) as lead_plan,
s.start_date,LEAD(s.start_date) OVER(PARTITION BY s.customer_id) as lead_date
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id
ORDER BY customer_id
)
SELECT * FROM downgrade
WHERE  plan_name = 'pro monthly' and lead_plan = 'basic monthly'
AND year(start_date) = 2020;