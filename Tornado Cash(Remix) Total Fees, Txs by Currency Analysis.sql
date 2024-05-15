-- currency_symbol

-- total_fee

-- total_transaction_count

SELECT
  currency_symbol,
  SUM(fee) AS total_fee,
  COUNT(tx_hash) AS total_transaction_count
FROM
  (
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_ethereum.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_bnb.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_avalanche_c.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_polygon.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_optimism.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_gnosis.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      fee,
      tx_hash
    FROM
      tornado_cash_arbitrum.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_ethereum.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_bnb.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_avalanche_c.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_polygon.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_optimism.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_gnosis.deposits
    UNION ALL
    SELECT
      currency_symbol,
      0 AS fee,
      tx_hash
    FROM
      tornado_cash_arbitrum.deposits
  ) AS combined_transactions
GROUP BY
  currency_symbol;