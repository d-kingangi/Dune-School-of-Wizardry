-- tables
-- platypus_finance.trades
-- platypus_finance_avalanche_c.trades

SELECT
  COALESCE(pf.block_date, pfac.block_date) AS block_date,
  COALESCE(pf.token_bought_symbol, pfac.token_bought_symbol) AS currency_symbol,
  COALESCE(SUM(pf.amount_usd), 0) AS daily_amount_usd,
  COALESCE(SUM(pf.token_bought_amount), 0) AS daily_token_bought_amount,
  COALESCE(COUNT(DISTINCT pf.taker), 0) AS num_takers,
  COALESCE(COUNT(pf.tx_hash), 0) AS num_transactions
FROM
  platypus_finance.trades AS pf
  FULL OUTER JOIN platypus_finance_avalanche_c.trades AS pfac ON pf.token_bought_symbol = pfac.token_bought_symbol
  AND pf.block_date = pfac.block_date
WHERE
  COALESCE(pf.token_bought_symbol, pfac.token_bought_symbol) IN ('USDC.e', 'USDC', 'DAI', 'DAI.e', 'USDt')
  AND COALESCE(pf.block_date, pfac.block_date) >= CURRENT_DATE
GROUP BY
  COALESCE(pf.block_date, pfac.block_date),
  COALESCE(pf.token_bought_symbol, pfac.token_bought_symbol)
ORDER BY
  block_date DESC,
  currency_symbol;