/* query to find success rate of transactions over time, grouping them by days */

SELECT
  DATE_TRUNC('day', block_time) AS Day,
  COUNT(*) AS TotalTransactions,
  SUM(CASE WHEN success THEN 1 ELSE 0 END) AS SuccessfulTransactions
FROM ethereum.transactions
GROUP BY
  1
ORDER BY
  Day