-- block_date
-- blockchain
-- daily_withdrawal_count
-- daily_withdrawal_amount
-- daily_withdrawer_count


SELECT
  block_date,
  blockchain,
  COUNT(tx_hash) AS daily_withdrawal_count,
  SUM(amount) AS daily_withdrawal_amount,
  COUNT(DISTINCT tx_from) AS daily_withdrawer_count
FROM
  (
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_ethereum.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_bnb.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_avalanche_c.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_polygon.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_optimism.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_gnosis.withdrawals
    UNION ALL
    SELECT
      block_date,
      blockchain,
      tx_hash,
      amount,
      tx_from
    FROM
      tornado_cash_arbitrum.withdrawals
  ) AS combined_withdrawals
GROUP BY
  block_date,
  blockchain;