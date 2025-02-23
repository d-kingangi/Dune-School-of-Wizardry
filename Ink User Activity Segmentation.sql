WITH user_segments AS (
  SELECT
    t."from" AS from_address,
    COUNT(*) AS tx_count,
    COUNT(DISTINCT DATE_TRUNC('day', b.time)) AS active_days,
    AVG(t.gas_used) AS avg_gas_used,
    MIN(b.time) AS first_tx,
    MAX(b.time) AS last_tx
  FROM ink.transactions AS t
  JOIN ink.blocks AS b
    ON t.block_number = b.number
  GROUP BY
    1
)
SELECT
  CASE
    WHEN tx_count >= 100
    THEN 'Power User'
    WHEN tx_count >= 10
    THEN 'Regular User'
    ELSE 'Casual User'
  END AS user_segment,
  COUNT(*) AS user_count,
  AVG(tx_count) AS avg_transactions,
  AVG(active_days) AS avg_active_days
FROM user_segments
GROUP BY
  1


--   user_segment
-- user_count
-- avg_transactions
-- avg_active_days
-- Regular User
-- 123420
-- 31.70802139037433
-- 18.306392805055907
-- Power User
-- 3697
-- 2384.735190695158
-- 31.69542872599405
-- Casual User
-- 124523
-- 2.7415497538607325
-- 1.9627618994081415