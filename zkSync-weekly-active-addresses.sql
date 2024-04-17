--finding active addresses on the zkSync l2 network


SELECT
  DATE_TRUNC('week', block_time) AS week_start,
  COUNT(DISTINCT "from") AS active_addresses
FROM zksync.transactions
WHERE
  EXTRACT(YEAR FROM block_time) >= 2021
GROUP BY
  1
ORDER BY
  week_start