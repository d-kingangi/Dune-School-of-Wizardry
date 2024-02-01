--JUP token holders 

WITH
  user_first_ts AS (
    SELECT
      ELEMENT_AT(account_keys, 0 + 1) AS wallet,
      MIN(DATE_TRUNC('day', block_time)) AS first_seen
    FROM
      solana.transactions
    WHERE
      NOT block_time IS NULL
      AND CONTAINS(
        account_keys,
        'JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN' --JUP Token address
      )
      AND block_time >= DATE_TRUNC('day', NOW() - INTERVAL '14' day)
      AND block_time < DATE_TRUNC('day', NOW())
    GROUP BY
      1
  )
SELECT
  first_seen AS day,
  SUM(COUNT(DISTINCT wallet)) OVER (
    ORDER BY
      first_seen NULLS FIRST
  ) AS cumulative_wallets
FROM
  user_first_ts
GROUP BY
  1