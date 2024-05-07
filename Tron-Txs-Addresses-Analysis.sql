

WITH daily_transactions AS (
  SELECT
    block_date,
    COUNT(*) AS successful_transactions,
    COUNT(DISTINCT "from") AS unique_senders,
    COUNT(DISTINCT "to") AS unique_receivers
  FROM tron.transactions
  WHERE
    success = TRUE
  GROUP BY
    block_date
)
SELECT
  block_date,
  successful_transactions,
  unique_senders + unique_receivers AS unique_addresses
FROM daily_transactions
ORDER BY
  block_date DESC