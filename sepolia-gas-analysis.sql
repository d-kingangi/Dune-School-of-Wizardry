

-- time
-- total_gas_used
-- avg_gas_used
-- median_gas_used

SELECT
  DATE_TRUNC('week', block_time) AS time,
  SUM(gas_used) AS total_gas_used,
  AVG(gas_used) AS avg_gas_used,
  APPROX_PERCENTILE(gas_used, 0.5) AS median_gas_used
FROM sepolia.transactions
WHERE
  block_time >= CAST('2022-10-01' AS TIMESTAMP)
GROUP BY
  1