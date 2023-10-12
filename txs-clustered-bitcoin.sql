/* query to cluster/group transactions based on their size and output value.*/

WITH transaction_clusters AS (
  SELECT
    id,
    size,
    output_value
  FROM bitcoin.transactions
)
SELECT
  size AS Cluster,
  COUNT(*) AS TransactionCount
FROM transaction_clusters
GROUP BY
  1
ORDER BY
  TransactionCount DESC