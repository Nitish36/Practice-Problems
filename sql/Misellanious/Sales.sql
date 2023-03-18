CREATE Table Sales
(
    Item VARCHAR(20),
    Price INT,
    Item_id INT
);
INSERT INTO Sales VALUES('Pizza',350,1);
INSERT INTO Sales VALUES('Momos',50,2);
INSERT INTO Sales VALUES('Burger',150,3);
INSERT INTO Sales VALUES('Chilli Potato',200,4);
INSERT INTO Sales VALUES('Coffee',200,4);
INSERT INTO Sales VALUES('Burger',250,1);
INSERT INTO Sales VALUES('Coffee',300,5);


Q1. Find the total sum of all the items purchased from the Sales table.

SELECT SUM(Price) AS Total_Sum
FROM Sales;

Q2. Find the duplicate count for each item present in the table.

SELECT Item, COUNT(Item)
FROM Sales
GROUP BY Item
HAVING Count(Item)>1;
