-- transaction_day
-- number_of_transactions

SELECT
  DATE_TRUNC('day', block_time) AS transaction_day,
  COUNT(*) AS number_of_transactions
FROM sepolia.transactions
WHERE
block_time >= DATE_TRUNC('day', CURRENT_DATE) - INTERVAL '365' day
GROUP BY
  DATE_TRUNC('day', block_time)
ORDER BY
  transaction_day