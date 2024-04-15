--find and compare the weekly transaction volume within the major layer 2 neetworks
-- Polygon, optimism, arbitrum, base

SELECT
  'Base' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  COUNT(*) AS transaction_count
FROM
  base.transactions
WHERE
  block_time >= DATE '2023-01-01'
  AND block_time < CURRENT_DATE
GROUP BY
  2
UNION ALL
SELECT
  'Polygon' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  COUNT(*) AS transaction_count
FROM
  polygon.transactions
WHERE
  block_time >= DATE '2023-01-01'
  AND block_time < CURRENT_DATE
GROUP BY
  2
UNION ALL
SELECT
  'Arbitrum' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  COUNT(*) AS transaction_count
FROM
  arbitrum.transactions
WHERE
  block_time >= DATE '2023-01-01'
  AND block_time < CURRENT_DATE
GROUP BY
  2
UNION ALL
SELECT
  'Optimism' AS network,
  DATE_TRUNC('week', block_time) AS week_start,
  COUNT(*) AS transaction_count
FROM
  optimism.transactions
WHERE
  block_time >= DATE '2023-01-01'
  AND block_time < CURRENT_DATE
GROUP BY
  2
ORDER BY
  week_start,
  network;