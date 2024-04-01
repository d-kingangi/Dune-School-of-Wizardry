--fees and transactions for the $WIF(DogWifHat) MemeCoin

WITH
  stats AS (
    SELECT
      SUM(fee) AS fees,
      COUNT(fee) AS txs
    FROM
      solana.transactions
    WHERE
      block_time > now() - interval '30' day
      AND CONTAINS(
        account_keys,
        'EKpQGSJtjMFqKZ9KQanSqYXRcF8fBopzLHYxdM65zcjm' -- $WIF Mint Address
      ) = TRUE
      AND success = TRUE
  )
SELECT
  fees,
  txs
FROM
  stats