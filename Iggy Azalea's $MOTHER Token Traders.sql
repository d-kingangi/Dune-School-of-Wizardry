SELECT
  time,
  COUNT(DISTINCT user) AS active_users
FROM
  (
    SELECT
      ELEMENT_AT(account_keys, 0 + 1) AS user,
      MIN(DATE_TRUNC('day', block_time)) AS time
    FROM
      solana.transactions
    WHERE
      CONTAINS(
        account_keys,
        '3S8qX1MsMqRbiwKg2cQyx7nis1oHMgaCuc9c4VfvVdPN'
      )
      AND success = TRUE
      AND block_time > NOW() - INTERVAL '180' day
    GROUP BY
      1
  )
GROUP BY
  1