block_date
token
daily_total_amount_usd

WITH
  token_totals AS (
    SELECT
      token_bought_symbol AS token,
      SUM(amount_usd) AS total_amount_usd
    FROM
      (
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow.trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_ethereum.trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_bnb.trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_optimism.trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_avalanche_c.trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow.cross_chain_trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_ethereum.crosschain_trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_bnb.crosschain_trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_optimism.crosschain_trades
        UNION ALL
        SELECT
          token_bought_symbol,
          amount_usd
        FROM
          hashflow_avalanche_c.crosschain_trades
      ) AS all_trades
    GROUP BY
      token_bought_symbol
    ORDER BY
      total_amount_usd DESC
    LIMIT
      7
  )
SELECT
  block_date,
  token_bought_symbol AS token,
  SUM(amount_usd) AS daily_total_amount_usd
FROM
  (
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow.trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_bnb.trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_optimism.trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_avalanche_c.trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow.cross_chain_trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_ethereum.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_bnb.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_optimism.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      token_bought_symbol,
      amount_usd
    FROM
      hashflow_avalanche_c.crosschain_trades
  ) AS all_trades
WHERE
  token_bought_symbol IN (
    SELECT
      token
    FROM
      token_totals
  )
GROUP BY
  block_date,
  token_bought_symbol
ORDER BY
  block_date,
  token_bought_symbol;


  2022-01-10
DAI
4617.3655
2022-01-10
ETH
422966.1784290351
2022-01-10
USDC
209370.65019999997
2022-01-10
USDT
546837.0426900533
2022-01-11
DAI
917547.4787279407
2022-01-11
ETH
3518309.641722358
2022-01-11
USDC
2106778.9034026056
2022-01-11
USDT
3179164.721639681
2022-01-12
DAI
2890762.653174212
2022-01-12
ETH
2191878.120564275
2022-01-12
USDC
2774573.9707330433
2022-01-12
USDT
3628092.5277851727
2022-01-13
DAI
2039006.5897288574
2022-01-13
ETH
1881266.9022534087
2022-01-13
USDC
5574020.313832837
2022-01-13
USDT
5975535.8094013315
2022-01-14
DAI
8640559.85963086
2022-01-14
ETH
1032491.9539446784
2022-01-14
USDC
9868213.290412612
2022-01-14
USDT
5123804.800371602
2022-01-15
DAI
4971070.896240283
2022-01-15
ETH
1583671.2374991172
2022-01-15
USDC
8584570.604687644
2022-01-15
USDT
7916226.360130765
2022-01-16
DAI
2797853.9354768796