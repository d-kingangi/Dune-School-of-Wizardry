-- block_date
-- token_symbol
-- daily_token_amount_raw
-- daily_token_amount
-- daily_amount_usd
-- daily_transaction_count
-- unique_addresses

WITH
  combined_trades AS (
    SELECT
      *
    FROM
      openocean_optimism.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean_v2_fantom.trades
    UNION ALL
    SELECT
      *
    FROM
      openocean_v2_avalanche_c.trades
  ),
  token_data AS (
    SELECT
      block_date,
      token_bought_symbol AS token_symbol,
      token_bought_amount_raw AS token_amount_raw,
      token_bought_amount AS token_amount,
      amount_usd,
      tx_hash,
      maker,
      taker
    FROM
      combined_trades
    UNION ALL
    SELECT
      block_date,
      token_sold_symbol AS token_symbol,
      token_sold_amount_raw AS token_amount_raw,
      token_sold_amount AS token_amount,
      amount_usd,
      tx_hash,
      maker,
      taker
    FROM
      combined_trades
  ),
  daily_token_stats AS (
    SELECT
      block_date,
      token_symbol,
      SUM(token_amount_raw) AS daily_token_amount_raw,
      SUM(token_amount) AS daily_token_amount,
      SUM(amount_usd) AS daily_amount_usd,
      COUNT(DISTINCT tx_hash) AS daily_transaction_count,
      COUNT(DISTINCT maker) + COUNT(DISTINCT taker) AS unique_addresses
    FROM
      token_data
    WHERE
      token_symbol IN ('WETH.e', 'USDT', 'USDC', 'DAI', 'BTC.b', 'OP')
    GROUP BY
      block_date,
      token_symbol
  ),
  ranked_tokens AS (
    SELECT
      *,
      RANK() OVER (PARTITION BY block_date ORDER BY daily_amount_usd DESC) AS rank
    FROM
      daily_token_stats
  )
SELECT
  block_date,
  token_symbol,
  daily_token_amount_raw,
  daily_token_amount,
  daily_amount_usd,
  daily_transaction_count,
  unique_addresses
FROM
  ranked_tokens
WHERE
  rank <= 7
ORDER BY
  block_date DESC,
  daily_amount_usd DESC;

