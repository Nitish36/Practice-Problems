SELECT COUNT(DISTINCT policy_holder_id) AS member_count
FROM callers
WHERE policy_holder_id IN (SELECT policy_holder_id FROM callers GROUP BY policy_holder_id HAVING COUNT(DISTINCT case_id)>=3)
