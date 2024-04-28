SELECT * FROM customer_nodes;
SELECT * FROM customer_transactions;
SELECT * FROM regions;

#---------------------------- A. Customer Nodes Exploration ------------------------#

#1 How many unique nodes are there on the Data Bank system?
SELECT COUNT(DISTINCT node_id) as distinct_node_count
FROM customer_nodes;

#2 What is the number of nodes per region?
SELECT r.region_name,count(cn.node_id) as count_of_nodes
FROM regions r
INNER JOIN customer_nodes cn
ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY 2 DESC;

#3 How many customers are allocated to each region?
SELECT r.region_name,count(DISTINCT cn.customer_id) as count_of_customers
FROM regions r
INNER JOIN customer_nodes cn
ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY 2 DESC;

#4 How many days on average are customers reallocated to a different node?
SELECT AVG(DATEDIFF(end_date,start_date)) AS avg_number_of_day
FROM customer_nodes
WHERE end_date != '9999-12-31';

#----------------------------B. Customer Transactions ------------------------#

#1 What is the unique count and total amount for each transaction type?
SELECT txn_type,COUNT(txn_type),SUM(txn_amount)
FROM customer_transactions
GROUP BY txn_type;

#2 What is the average total historical deposit counts and amounts for all customers?
WITH CTE AS
(
	SELECT customer_id,
    COUNT(CASE WHEN txn_type = 'deposit' THEN 1 END) AS txn_count,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount END) AS txn_sum
    FROM customer_transactions
    group by customer_id
)
SELECT AVG(txn_count),AVG(txn_sum)
FROM CTE;

#3 For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
WITH activity AS
(
	SELECT customer_id,monthname(txn_date) as month_name,
    COUNT(CASE WHEN txn_type = 'deposit' THEN 1 END) AS deposit_count,
    COUNT(CASE WHEN txn_type = 'withdrawal' THEN 1 END) AS withdraw_count,
    COUNT(CASE WHEN txn_type = 'purchase' THEN 1 END) AS purchase_count
    FROM customer_transactions
    GROUP BY customer_id,month_name
)
SELECT month_name,COUNT(customer_id)
FROM activity
WHERE deposit_count>1 AND (withdraw_count>0 OR purchase_count>0)
GROUP BY month_name;

#4 What is the closing balance for each customer at the end of the month?
WITH transac AS
(
	SELECT customer_id,MIN(txn_date) as start_date,MAX(txn_date) as end_date,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -1*txn_amount END) AS transactions
	FROM customer_transactions
    GROUP BY customer_id
)
SELECT customer_id,SUM(transactions) OVER(PARTITION BY customer_id ORDER BY end_date)
FROM transac;