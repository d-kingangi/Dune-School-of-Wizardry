--active holders/ traders of the $WIF(DogWifHat) MemeCoin


SELECT
  day,
  COUNT(DISTINCT user) AS users
FROM
  (
    SELECT
      ELEMENT_AT(account_keys, 0 + 1) AS user,
      MIN(DATE_TRUNC('day', block_time)) AS day
    FROM
      solana.transactions
    WHERE
      CONTAINS(
        account_keys,
        'EKpQGSJtjMFqKZ9KQanSqYXRcF8fBopzLHYxdM65zcjm'
      )
      AND success = TRUE
      AND block_time > NOW() - interval '5' day
    GROUP BY
      1
  )
GROUP BY
  1