WITH table1 AS (
  SELECT *, 
         ROW_NUMBER() OVER (ORDER BY id) 
       - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
  FROM Logs
),
table2 AS (
  SELECT num AS ConsecutiveNums, COUNT(*) AS cnt
  FROM table1
  GROUP BY num, grp
)
SELECT distinct ConsecutiveNums
FROM table2
WHERE cnt >= 3;
