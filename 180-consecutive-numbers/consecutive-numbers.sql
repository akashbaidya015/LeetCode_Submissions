WITH numbered AS (
  SELECT *,
         ROW_NUMBER() OVER (ORDER BY id) 
         - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
  FROM Logs
),
grouped AS (
  SELECT num, COUNT(*) AS cnt
  FROM numbered
  GROUP BY num, grp
)
SELECT DISTINCT num as ConsecutiveNums 
FROM grouped
WHERE cnt >= 3;
