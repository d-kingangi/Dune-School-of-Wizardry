-- query to find Statistics on the zkSync Bridge including: Total Value Bridged(TVB), bridgers, over 7 days


SELECT
  COUNT(DISTINCT CASE WHEN block_time > CURRENT_TIMESTAMP - INTERVAL '7' day THEN "from" ELSE NULL END) AS users_last_7_days,
  SUM(CASE WHEN block_time > CURRENT_TIMESTAMP - INTERVAL '7' day THEN value / CAST(1e18 AS DOUBLE) ELSE 0 END) AS total_last_7_days,
  COUNT(DISTINCT "from") AS users_all_time,
  SUM(value / CAST(1e18 AS DOUBLE)) AS total_all_time
FROM
  ethereum.transactions
WHERE
  (
    "to" = 0xaBEA9132b05A70803a4E85094fD0e1800777fBEF -- contract address for zkSync Lite Bridge
    OR
    "to" = 0x32400084C286CF3E17e7B677ea9583e60a000324 -- contract address for zkSync Era Bridge
  )
  AND success = TRUE; --for successful transactions
