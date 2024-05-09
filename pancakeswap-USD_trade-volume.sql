-- 1290413603081.8623 USD Volume

SELECT
  SUM(amount_usd) AS total_amount_usd
FROM
  (
    SELECT
      amount_usd
    FROM
      pancakeswap_v3_bnb.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v3_ethereum.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v3_arbitrum.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v3_base.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v2_bnb.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v2_arbitrum.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v2_ethereum.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap_v2_base.amm_trades
    UNION ALL
    SELECT
      amount_usd
    FROM
      pancakeswap.trades
  ) AS combined_trades;