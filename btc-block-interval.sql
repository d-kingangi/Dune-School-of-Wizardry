/* query to find time intervals between consecutive blocks on bitcoin network */

WITH block_intervals AS (
  SELECT
    date,
    LAG(date) OVER (ORDER BY date) AS PreviousDate
  FROM bitcoin.blocks
)
SELECT
  date,
  PreviousDate,
  EXTRACT(SECOND FROM (
    date - PreviousDate
  )) AS IntervalInSeconds
FROM block_intervals
WHERE
  NOT PreviousDate IS NULL