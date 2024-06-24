-- tables
-- platypus_finance.trades
-- platypus_finance_avalanche_c.trades

SELECT
  block_date,
  token_bought_symbol AS currency_symbol,
  SUM(daily_amount_usd) AS daily_amount_usd,
  SUM(daily_token_bought_amount) AS daily_token_bought_amount,
  SUM(num_takers) AS num_takers,
  SUM(num_transactions) AS num_transactions
FROM (
  SELECT
    block_date,
    token_bought_symbol,
    SUM(amount_usd) AS daily_amount_usd,
    SUM(token_bought_amount) AS daily_token_bought_amount,
    COUNT(DISTINCT taker) AS num_takers,
    COUNT(tx_hash) AS num_transactions
  FROM platypus_finance.trades
  WHERE
    token_bought_symbol IN ('USDC.e', 'USDC', 'DAI', 'DAI.e', 'USDt')
    AND block_date >= CURRENT_DATE
  GROUP BY
    block_date,
    token_bought_symbol
  UNION ALL
  SELECT
    block_date,
    token_bought_symbol,
    SUM(amount_usd) AS daily_amount_usd,
    SUM(token_bought_amount) AS daily_token_bought_amount,
    COUNT(DISTINCT taker) AS num_takers,
    COUNT(tx_hash) AS num_transactions
  FROM platypus_finance_avalanche_c.trades
  WHERE
    token_bought_symbol IN ('USDC.e', 'USDC', 'DAI', 'DAI.e', 'USDt')
    AND block_date >= CURRENT_DATE
  GROUP BY
    block_date,
    token_bought_symbol
) AS combined_results
GROUP BY
  block_date,
  token_bought_symbol
ORDER BY
  block_date DESC,
  token_bought_symbol