"""
Imagine you're working for a library and you're tasked with generating a report on the borrowing habits of patrons. You have two tables in your database: Books and Borrowers.

 

Write an SQL to display the name of each borrower along with a comma-separated list of the books they have borrowed in alphabetical order, display the output in ascending order of Borrower Name.

 

Tables: Books
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| BookID      | int         |
| BookName    | varchar(30) |
| Genre       | varchar(20) |
+-------------+-------------+

Tables: Borrowers
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| BorrowerID   | int         |
| BorrowerName | varchar(10) |
| BookID       | int         |
+--------------+-------------+
"""

WITH CTE AS
(
  SELECT Bo.BorrowerName,B.BookName
  FROM Books B
  INNER JOIN Borrowers Bo
  ON B.BookID = Bo.BookID
)
SELECT BorrowerName,GROUP_CONCAT(BookName ORDER BY BookName ASC, ",") as Ordered_BookNames
FROM CTE
GROUP BY BorrowerName
