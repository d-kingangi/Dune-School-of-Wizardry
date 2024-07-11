-- find total mothly fees on the gnosis chain for the past 12 months

SELECT
  DATE_TRUNC('month', block_time) AS month,
  SUM(CAST(gas_used AS DOUBLE)*CAST(gas_price AS DOUBLE))/1e18 AS total
FROM
  gnosis.transactions
WHERE
  block_time > CURRENT_TIMESTAMP - INTERVAL '12' month
GROUP BY
  1
ORDER BY
  1 DESC