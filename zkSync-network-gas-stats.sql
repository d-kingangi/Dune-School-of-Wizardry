SELECT
  DATE_TRUNC('week', block_time) AS week_start,
  AVG(gas_limit) AS avg_gas_limit,
  AVG(gas_used) AS avg_gas_used,
  AVG(gas_price) AS avg_gas_price
FROM
  zksync.transactions
GROUP BY
  1
ORDER BY
  week_start