SELECT candidate_id 
FROM candidates
WHERE problem_solving = 'X' AND sql_experience = 'X'
  AND python = 'X' OR r_programming = 'X' AND 
  domain_knowledge = 'X';
