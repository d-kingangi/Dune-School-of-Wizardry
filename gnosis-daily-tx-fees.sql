-- finding total daily fees paid on the gnosis blockchain for the past 3 months


SELECT
  DATE_TRUNC('day', block_time) AS day,
  SUM(CAST(gas_used AS DOUBLE)*CAST(gas_price AS DOUBLE))/1e18 AS total
FROM
  gnosis.transactions
WHERE
  block_time > CURRENT_TIMESTAMP - INTERVAL '90' day
GROUP BY
  1
ORDER BY
  1 DESC

