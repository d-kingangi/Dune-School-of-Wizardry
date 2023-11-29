-- linea chain daily unique users 
WITH alldeposits AS (
  SELECT DISTINCT
    "from",
    block_time
  FROM ethereum.transactions
  WHERE
    "to" = 0xd19d4B5d358258f05D7B411E21A1460D11B1 -- linea L1 bridge contract
)
SELECT
  DATE_TRUNC('day', block_time) AS day,
  COUNT(DISTINCT "from") AS unique_users_count
FROM alldeposits
GROUP BY
  1
ORDER BY
  1 DESC