/* query to perform flow analysis to identify common paths of ethereum.transactions, group sender-receiver relationships */

WITH transaction_flows AS (
  SELECT
    "from" AS Sender,
    "to" AS Receiver,
    COUNT(*) AS TransactionCount
  FROM ethereum.transactions
  GROUP BY
    1,
    2
  HAVING
    COUNT(*) > 5
)
SELECT
  Sender,
  Receiver,
  SUM(TransactionCount) AS TotalTransactions
FROM transaction_flows
GROUP BY
  Sender,
  Receiver
ORDER BY
  TotalTransactions DESC