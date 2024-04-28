SELECT * FROM customer_orders;
SELECT * FROM pizza_names;
SELECT * FROM pizza_recipes;
SELECT * FROM pizza_toppings;
SELECT * FROM runner_orders;
SELECT * FROM runners;
SELECT * FROM cust_orders;
SELECT * FROM runner_orders_pre;
SELECT * FROM runner_orders_post;
SELECT * FROM toppings;

#----------------------  A. Pizza Metrics ------------------#

#1) How many pizzas were ordered?
SELECT COUNT(pizza_id) as count_of_pizzas_ordered FROM customer_orders;

#2) How many unique customer orders were made?
SELECT COUNT(DISTINCT order_id) as unique_customers FROM customer_orders;

#3) How many successful orders were delivered by each runner?
SELECT r.runner_id,COUNT(ro.order_id) as successful_orders
FROM runner_orders_post ro
INNER JOIN runners r
ON ro.runner_id = r.runner_id
WHERE ro.cancellation IS null
GROUP BY r.runner_id;

#4) How many of each type of pizza was delivered?
SELECT pn.pizza_name,COUNT(co.pizza_id) as count_of_each_type
FROM customer_orders co 
INNER JOIN pizza_names pn
WHERE co.pizza_id = pn.pizza_id
GROUP BY pn.pizza_name;

#5) How many Vegetarian and Meatlovers were ordered by each customer?
SELECT co.customer_id,
COUNT(CASE WHEN pn.pizza_name = 'Meatlovers' THEN 1 END) as meat_count,
COUNT(CASE WHEN pn.pizza_name = 'Vegetarian' THEN 1 END) as veg_count
FROM customer_orders co
INNER JOIN pizza_names pn
ON co.pizza_id = pn.pizza_id
GROUP BY co.customer_id;

#6 What was the maximum number of pizzas delivered in a single order?
SELECT order_id,COUNT(pizza_id) as max_num_of_pizzas
FROM customer_orders
GROUP BY order_id
ORDER BY max_num_of_pizzas DESC;

#7 For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT co.customer_id,
SUM(CASE WHEN co.exclusions_cleaned LIKE '%' OR co.extras_cleaned LIKE '%' THEN 1 ELSE 0 END) AS atleast_1_change,
SUM(CASE WHEN co.exclusions_cleaned IS null AND (co.extras_cleaned IS null) THEN 1 ELSE 0 END) AS no_changes
FROM cust_orders co
LEFT JOIN runner_orders_post ro 
    ON co.order_id = ro.order_id
WHERE ro.duration_mins IS NOT NULL
GROUP BY co.customer_id;

#8 How many pizzas were delivered that had both exclusions and extras?
SELECT COUNT(co.pizza_id) as count
FROM cust_orders co
LEFT JOIN runner_orders_post ro 
    ON co.order_id = ro.order_id
WHERE exclusions_cleaned IS NOT NULL and extras_cleaned IS NOT NULL and ro.duration_mins IS NOT NULL;

#9 What was the total volume of pizzas ordered for each hour of the day?
SELECT HOUR(order_time) as hr,COUNT(order_id) as vol_orders
FROM cust_orders
GROUP BY hr
ORDER BY hr ASC;

#10 What was the volume of orders for each day of the week?
SELECT CASE WHEN WEEKDAY(order_time) = 0 THEN 'Monday'
        WHEN WEEKDAY(order_time) = 1 THEN 'Tuesday'
        WHEN WEEKDAY(order_time) = 2 THEN 'Wednesday'
        WHEN WEEKDAY(order_time) = 3 THEN 'Thursday'
        WHEN WEEKDAY(order_time) = 4 THEN 'Friday'
        WHEN WEEKDAY(order_time) = 5 THEN 'Saturday'
        WHEN WEEKDAY(order_time) = 6 THEN 'Sunday' END as day,
COUNT(order_id) as vol_orders
FROM cust_orders
GROUP BY day
ORDER BY day ASC;

#----------------------  B. Runner and Customer Experience ------------------#

#1 How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
SELECT COUNT(runner_id) AS runner_count, WEEK(registration_date) AS week
FROM runners
GROUP BY week;

#2 What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
SELECT ro.runner_id,AVG(MINUTE(timediff(ro.pick_up_time,c.order_time))) as avg_time
FROM cust_orders c
INNER JOIN runner_orders_post ro
ON c.order_id = ro.order_id
GROUP BY ro.runner_id;

#3 Is there any relationship between the number of pizzas and how long the order takes to prepare?
#As the number of pizzas increases per order, the time to prepare an order increases. This is shown with order 4 with customer
#id 103 ranking at the highest in time prep of 29 mins. There seems to be a slight variance with orders consisting of 2 pizzas taking
# anywhere from 15 - 21 mins, while an order of 1 pizza takes as short as 10 minutes.

#4 What was the average distance travelled for each customer?
SELECT co.customer_id,AVG(ro.distance_km) as avg_distance
FROM runner_orders_post  ro
INNER JOIN customer_orders co on ro.order_id = co.order_id
GROUP BY co.customer_id;

#5 What was the difference between the longest and shortest delivery times for all orders?
SELECT
    MAX(duration_mins) - MIN(duration_mins) AS delivery_time_diff
FROM runner_orders_post;
#6 What was the average speed for each runner for each delivery and do you notice any trend for these values?
SELECT r.runner_id,AVG(ro.distance_km),AVG(ro.duration_mins),AVG(ro.distance_km/(ro.duration_mins/60)) as avg_speed
FROM runners r 
INNER JOIN runner_orders_post ro
ON r.runner_id = ro.runner_id
GROUP BY r.runner_id;

#----------------------  C. Ingredient Optimization ------------------#
#1 What are the standard ingredients for each pizza?
SELECT pn.pizza_name,GROUP_CONCAT(pt.topping_name ORDER BY pt.topping_id ASC SEPARATOR ', ') AS toppings
FROM pizza_names pn
INNER JOIN toppings t ON pn.pizza_id = t.pizza_id
INNER JOIN pizza_toppings pt ON t.toppings = pt.topping_id
GROUP BY pn.pizza_name;

#2 What was the most commonly added extra?
SELECT extras_cleaned,COUNT(extras_cleaned) as count
FROM cust_orders
WHERE extras_cleaned LIKE '%' and extras_cleaned <> 'null'
GROUP BY extras_cleaned;

#3 What was the most common exclusion?
SELECT exclusions_cleaned,COUNT(exclusions_cleaned) as count
FROM cust_orders
WHERE exclusions_cleaned LIKE '%' and exclusions_cleaned <> 'null'
GROUP BY exclusions_cleaned;

#4 Generate an order item for each record in the customers_orders table in the format of one of the following:
# Meat Lovers
SELECT order_id
FROM cust_orders
WHERE pizza_id = 1
GROUP BY order_id;


#----------------------  D. Pricing and Ratings ------------------#
#1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has 
#   Pizza Runner made so far if there are no delivery fees?
SELECT SUM(CASE WHEN pizza_id = 1 THEN 12
                WHEN pizza_id = 2 THEN 10 END) as total_price
FROM cust_orders;

#5 If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per
# kilometre traveled - how much money does Pizza Runner have left over after these deliveries?
WITH total_price AS
(
	SELECT SUM(CASE WHEN pizza_id = 1 THEN 12
                WHEN pizza_id = 2 THEN 10 END) as total_price
FROM cust_orders
),dist_cost AS
(
	SELECT SUM(distance_km*0.3) as dist_cost
    FROM runner_orders_post
)
SELECT total_price-dist_cost
FROM total_price,dist_cost;

