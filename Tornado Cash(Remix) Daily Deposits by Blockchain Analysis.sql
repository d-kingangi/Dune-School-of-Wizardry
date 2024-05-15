
-- block_date
-- blockchain
-- daily_deposit_count
-- daily_deposit_amount
-- daily_depositor_count

SELECT
  block_date,
  blockchain,
  COUNT(tx_hash) AS daily_deposit_count,
  SUM(amount) AS daily_deposit_amount,
  COUNT(DISTINCT depositor) AS daily_depositor_count
FROM
  (
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_ethereum.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_bnb.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_avalanche_c.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_polygon.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_optimism.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_gnosis.deposits
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      depositor
    FROM
      tornado_cash_arbitrum.deposits
  ) AS combined_deposits
GROUP BY
  block_date,
  blockchain;