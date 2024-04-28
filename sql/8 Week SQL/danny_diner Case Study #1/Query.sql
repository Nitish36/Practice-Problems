SELECT * FROM members;
SELECT * FROM menu;
SELECT * FROM sales;

#1) What is the total amount each customer spent at the restaurant?
SELECT s.customer_id,SUM(m.price) as total_spent
FROM sales s
INNER JOIN menu m
ON s.product_id = m.product_id
GROUP BY s.customer_id;

#2 How many days has each customer visited the restaurant?
SELECT customer_id,COUNT(distinct(order_date)) as no_of_days
FROM sales
GROUP BY customer_id;

#3 What was the first item from the menu purchased by each customer?
SELECT DISTINCT s.customer_id,first_value(me.product_name) OVER(PARTITION BY s.customer_id ORDER BY s.order_date ASC) as first_product
FROM sales s
INNER JOIN menu me
ON s.product_id = me.product_id;

#4 What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT m.product_name,COUNT(s.product_id) as product_count
FROM sales s
INNER JOIN menu m
ON m.product_id = s.product_id
GROUP BY m.product_name
ORDER BY product_count DESC
LIMIT 1;

#5 Which item was the most popular for each customer?
WITH CTE as
(
	SELECT s.customer_id,m.product_name,COUNT(m.product_name),
    RANK() OVER(PARTITION BY s.customer_id order by COUNT(m.product_name) DESC) as rnk
    FROM sales s
    INNER JOIN menu m
    ON s.product_id = m.product_id
    GROUP BY s.customer_id,m.product_name
)
SELECT customer_id,product_name
FROM CTE
WHERE rnk = 1;


#6 Which item was purchased first by the customer after they became a member?
WITH CTE AS(
SELECT s.customer_id,me.product_name,RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date ASC) as rnk
FROM sales s
INNER JOIN menu me ON s.product_id = me.product_id
Inner Join members m ON s.customer_id = m.customer_id
WHERE s.order_date>=m.join_date
)
SELECT customer_id,product_name
FROM CTE
WHERE rnk = 1;

#7 Which item was purchased just before the customer became a member?
WITH CTE AS(
SELECT s.customer_id,me.product_name,RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date ASC) as rnk
FROM sales s
INNER JOIN menu me ON s.product_id = me.product_id
Inner Join members m ON s.customer_id = m.customer_id
WHERE s.order_date<m.join_date
)
SELECT customer_id,product_name
FROM CTE
WHERE rnk = 1;

#8 What is the total items and amount spent for each member before they became a member?
SELECT s.customer_id,COUNT(s.product_id) as count_of_prod,SUM(me.price) as total_spent
FROM sales s
INNER JOIN members m ON m.customer_id = s.customer_id
INNER JOIN menu me ON me.product_id = s.product_id
WHERE s.order_date<m.join_date
GROUP BY s.customer_id;

#9 If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
WITH points as
(
	SELECT s.customer_id,CASE WHEN m.product_name = 'sushi' THEN 20*m.price ELSE 10*m.price END AS points
    FROM sales s
    INNER JOIN menu m
    ON s.product_id = m.product_id
)
SELECT customer_id,SUM(points)
FROM points
GROUP BY customer_id;
