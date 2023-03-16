CREATE TABLE Transactions
(
	TransactionDate DATE,
        TransactionAmt INT
);
INSERT INTO Transactions VALUES('2019-01-01',1000);
INSERT INTO Transactions VALUES('2018-02-23',8000);
INSERT INTO Transactions VALUES('2015-02-03',10000);
INSERT INTO Transactions VALUES('2014-12-23',5000);
INSERT INTO Transactions VALUES('2017-11-13',7000);
INSERT INTO Transactions VALUES('2015-02-03',7000);
INSERT INTO Transactions VALUES('2017-11-13',8000);

SELECT SUM(TransactionAmt)
FROM Transactions
GROUP BY TransactionDate;
