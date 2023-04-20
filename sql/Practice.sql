CREATE TABLE tblEmpScores(IdCol INT, vcName VARCHAR(20), iScore INT);
INSERT INTO tblEmpScores VALUES
(1011, "Scott", 2100),
(1012, "Peter", 2220),
(1013, "John", 2010),
(1014, "George", 2009),
(1015, "Thomos", 2500),
(1016, "Veronica", 2110),
(1017, "Anthony", 2011);

SELECT * FROM tblEmpScores;

-- The following is a sort of scoreboard where each person has their own set of points. To know where they stand, each row must have a low and high score associated with it.
SELECT *,
first_value(iScore) OVER(ORDER BY iScore DESC) AS HIGH_SCORE,
last_value(iScore) OVER(ORDER BY iScore DESC RANGE between unbounded preceding and unbounded following)
FROM  tblEmpScores;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------