WITH managers AS (
    SELECT managerId 
    FROM Employee 
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT E.name 
FROM Employee E 
JOIN managers M ON E.id = M.managerId;
