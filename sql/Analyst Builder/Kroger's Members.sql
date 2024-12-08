WITH Kronger AS
(
    SELECT kroger_id,
    CASE WHEN has_member_card='Y' THEN 1 END AS member_card
    FROM customers
)
SELECT ROUND(COUNT(member_card)/COUNT(*)*100,2)
FROM Kronger
