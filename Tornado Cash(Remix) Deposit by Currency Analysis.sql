-- currency_symbol
-- distinct_count
-- total_amount

SELECT
  currency_symbol,
  COUNT(DISTINCT currency_symbol) AS distinct_count,
  SUM(amount) AS total_amount
FROM
  (
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_ethereum.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_bnb.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_avalanche_c.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_polygon.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_optimism.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_gnosis.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_arbitrum.withdrawals
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_ethereum.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_bnb.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_avalanche_c.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_polygon.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_optimism.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_gnosis.deposits
    UNION ALL
    SELECT
      currency_symbol,
      amount
    FROM
      tornado_cash_arbitrum.deposits
  ) AS combined_transactions
GROUP BY
  currency_symbol;