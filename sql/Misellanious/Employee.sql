CREATE TABLE Dim_Employee
(
	EmpID INT PRIMARY KEY,
	EmployeeName VARCHAR(20)	
);

CREATE TABLE Dim_Salary
(
	SalaryLevel INT PRIMARY KEY,
	SalaryAmount INT
);

CREATE TABLE Map_Compensation
(
	Years DATE,
	EmpID REFERENCES Dim_Employee(EmpID);
	SalaryLevel REFERENCES Dim_Salary(SalaryLevel)
);
INSERT INTO Dim_Employee VALUES(1,'A');
INSERT INTO Dim_Employee VALUES(2,'B');
INSERT INTO Dim_Employee VALUES(3,'C');
INSERT INTO Dim_Employee VALUES(4,'D');
INSERT INTO Dim_Employee VALUES(5,'E');
INSERT INTO Dim_Employee VALUES(6,'F');

INSERT INTO Dim_Salary VALUES(11,200000);
INSERT INTO Dim_Salary VALUES(12,100000);
INSERT INTO Dim_Salary VALUES(13,300000);
INSERT INTO Dim_Salary VALUES(14,500000);
INSERT INTO Dim_Salary VALUES(15,600000);
INSERT INTO Dim_Salary VALUES(16,400000);

INSERT INTO Map_Compensation VALUES('2019-01-01',3,13);
INSERT INTO Map_Compensation VALUES('2020-12-13',5,16);
INSERT INTO Map_Compensation VALUES('2018-01-23',2,12);
INSERT INTO Map_Compensation VALUES('2022-12-12',4,14);
INSERT INTO Map_Compensation VALUES('2012-12-12',1,11);

SELECT DE.EmpID,DE.EmployeeName
FROM Dim_Employee DE,Dim_Salary DS,Map_Compensation M
WHERE DE.EmpID = M.EmpID AND DS.SalaryLevel = M.SalaryLevel AND SalaryAmount>100000 AND SalaryAmount<500000;
