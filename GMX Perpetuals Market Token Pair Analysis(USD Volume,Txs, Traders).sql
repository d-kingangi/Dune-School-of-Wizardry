
-- token pair to analyse 

-- 'USDC.e-WETH',
-- 'WBTC-WETH',
-- 'FRAX-WETH',
-- 'DAI-WETH',
-- 'LINK-USDC.e'


WITH
  combined_trades AS (
    SELECT
      block_date,
      blockchain,
      token_pair,
      tx_hash,
      taker,
      amount_usd
    FROM
      gmx.trades
    WHERE
      token_pair IN (
        'USDC.e-WETH',
        'WBTC-WETH',
        'FRAX-WETH',
        'DAI-WETH',
        'LINK-USDC.e'
      )
    UNION ALL
    SELECT
      block_date,
      blockchain,
      token_pair,
      tx_hash,
      taker,
      amount_usd
    FROM
      gmx_arbitrum.trades
    WHERE
      token_pair IN (
        'USDC.e-WETH',
        'WBTC-WETH',
        'FRAX-WETH',
        'DAI-WETH',
        'LINK-USDC.e'
      )
    UNION ALL
    SELECT
      block_date,
      blockchain,
      token_pair,
      tx_hash,
      taker,
      amount_usd
    FROM
      gmx_avalanche_c.trades
    WHERE
      token_pair IN (
        'USDC.e-WETH',
        'WBTC-WETH',
        'FRAX-WETH',
        'DAI-WETH',
        'LINK-USDC.e'
      )
  ),
  daily_totals AS (
    SELECT
      block_date,
      blockchain,
      token_pair,
      SUM(amount_usd) AS daily_amount_usd,
      COUNT(DISTINCT tx_hash) AS daily_tx_count,
      COUNT(DISTINCT taker) AS daily_unique_takers
    FROM
      combined_trades
    GROUP BY
      block_date,
      blockchain,
      token_pair
  )
SELECT
  block_date,
  blockchain,
  token_pair,
  daily_amount_usd,
  daily_tx_count,
  daily_unique_takers
FROM
  daily_totals
ORDER BY
  block_date,
  blockchain,
  token_pair;