CREATE TABLE Employers
(
	Emp_id INT PRIMARY KEY,
	name VARCHAR(20),
	salary INT
);

INSERT INTO Employers VALUES(1,'A',20000);
INSERT INTO Employers VALUES(2,'B',30000);
INSERT INTO Employers VALUES(3,'C',20000);
INSERT INTO Employers VALUES(4,'D',10000);

SELECT *
FROM Employers 
WHERE salary=(SELECT a.salary FROM Employers a WHERE salary = a.salary);
