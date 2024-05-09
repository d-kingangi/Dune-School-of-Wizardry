-- tables: pancakeswap_v3_bnb.amm_trades, 
--         pancakeswap_v3_ethereum.amm_trades
--         pancakeswap_v3_arbitrum.amm_trades
--         pancakeswap_v3_base.amm_trades
--         pancakeswap_v2_bnb.amm_trades
--         pancakeswap_v2_ethereum.amm_trades
--         pancakeswap_v2_arbitrum.amm_trades
--         pancakeswap_v2_base.amm_trades
--         pancakeswap.trades

SELECT
  block_date,
  SUM(amount_usd) AS daily_total_amount_usd
FROM
  (
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v3_bnb.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v3_ethereum.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v3_arbitrum.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v3_base.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v2_bnb.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v2_arbitrum.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v2_ethereum.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap_v2_base.amm_trades
    UNION ALL
    SELECT
      block_date,
      amount_usd
    FROM
      pancakeswap.trades
  ) AS combined_trades
GROUP BY
  block_date
ORDER BY
  block_date;