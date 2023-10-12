/* query to find longest consecutive on the bitcoin network  */

WITH block_gaps AS (
  SELECT
    date,
    LEAD(date) OVER (ORDER BY date) AS NextDate
  FROM bitcoin.blocks
)
SELECT
  MIN(date) AS StartDate,
  MAX(NextDate) AS EndDate,
  COUNT(*) + 1 AS ConsecutiveBlocks
FROM block_gaps
WHERE
NextDate - date = INTERVAL '1' day
GROUP BY
  date
ORDER BY
  ConsecutiveBlocks DESC
LIMIT 5