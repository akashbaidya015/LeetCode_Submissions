WITH Groups1 AS (
    SELECT
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
)
SELECT distinct num AS ConsecutiveNums
FROM Groups1
GROUP BY num, grp
HAVING COUNT(*) >= 3;
