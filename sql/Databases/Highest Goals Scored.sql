SELECT * FROM Goals
-- Your code here
WHERE goals_scored = (SELECT MAX(goals_scored) FROM Goals);
