CREATE TABLE Department
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

CREATE TABLE Employes
(
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(20),
    Dept_id REFERENCES Department(Dept_id),
    Salary INT,
    DOJ Date
);

INSERT INTO Department VALUES(1,'HR');
INSERT INTO Department VALUES(2,'SDE');
INSERT INTO Department VALUES(3,'DE');
INSERT INTO Department VALUES(4,'NA');
INSERT INTO Department VALUES(6,'Web');

INSERT INTO Employes VALUES(10,'A',1,10000,'2019-01-01');
INSERT INTO Employes VALUES(11,'B',3,20000,'2019-03-01');
INSERT INTO Employes VALUES(12,'C',6,40000,'2018-01-01');
INSERT INTO Employes VALUES(13,'D',1,50000,'2018-01-01');
INSERT INTO Employes VALUES(14,'E',3,10000,'2018-01-01');
INSERT INTO Employes VALUES(15,'F',1,10000,'2018-01-01');
INSERT INTO Employes VALUES(16,'G',4,10000,'2019-01-01');

Q1. Find the number of employees working in the department ‘HR’.
SELECT COUNT(E.Emp_id) AS COUNT_OF_HR
FROM Employes E 
INNER JOIN Department D ON E.Dept_id = D.Dept_id
WHERE D.dept_name = 'HR';

Q3. Find the 2nd highest salary without using top or limit.
Soln)
SELECT Emp_name,MAX(salary)
FROM Employes
WHERE salary < (SELECT MAX(salary) FROM Employes);
