/* query to identify transaction size patterns,  bitcoin.transactions*/

WITH size_patterns AS (
  SELECT
    block_date,
    size,
    COUNT(*) AS TransactionCount
  FROM bitcoin.transactions
  WHERE size > 0
  GROUP BY block_date, size
)
SELECT
  block_date,
  size,
  MAX(TransactionCount) AS MaxTransactionCount
FROM size_patterns
GROUP BY block_date, size
ORDER BY block_date, MaxTransactionCount DESC;