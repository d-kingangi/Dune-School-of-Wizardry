-- block_date
-- token_pair
-- daily_total_amount_usd
-- daily_number_of_transactions

WITH
  token_pair_totals AS (
    SELECT
      token_pair,
      SUM(amount_usd) AS total_amount_usd
    FROM
      (
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow.trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_ethereum.trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_bnb.trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_optimism.trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_avalanche_c.trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow.cross_chain_trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_ethereum.crosschain_trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_bnb.crosschain_trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_optimism.crosschain_trades
        UNION ALL
        SELECT
          CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
          amount_usd
        FROM
          hashflow_avalanche_c.crosschain_trades
      ) AS all_trades
    GROUP BY
      token_pair
    ORDER BY
      total_amount_usd DESC
    LIMIT
      7
  )
SELECT
  block_date,
  token_pair,
  SUM(amount_usd) AS daily_total_amount_usd,
  COUNT(DISTINCT tx_hash) AS daily_number_of_transactions
FROM
  (
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow.trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_ethereum.trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_bnb.trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_optimism.trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_avalanche_c.trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow.cross_chain_trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_ethereum.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_bnb.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_optimism.crosschain_trades
    UNION ALL
    SELECT
      block_date,
      CONCAT(token_bought_symbol, '/', token_sold_symbol) AS token_pair,
      amount_usd,
      CAST(tx_hash AS VARCHAR) AS tx_hash
    FROM
      hashflow_avalanche_c.crosschain_trades
  ) AS all_trades
WHERE
  token_pair IN (
    SELECT
      token_pair
    FROM
      token_pair_totals
  )
GROUP BY
  block_date,
  token_pair
ORDER BY
  block_date,
  token_pair;


2022-01-10
ETH/USDT
296154.7505037132
13
2022-01-10
USDT/ETH
308585.017248
10
2022-01-11
DAI/USDC
818020.3565062656
6
2022-01-11
ETH/USDT
2437421.1781942043
86
2022-01-11
USDC/USDT
1324631.1733245954
11
2022-01-11
USDT/ETH
1142880.9764208996
34
2022-01-11
USDT/USDC
1394371.49764125
7
2022-01-12
DAI/USDC
2196954.4518547575
13
2022-01-12
ETH/USDT
1341386.0194451786
74
2022-01-12
USDC/USDT
863812.2823460053
10
2022-01-12
USDT/ETH
899544.6089688352
32
2022-01-12
USDT/USDC
274686.9759295194
7
2022-01-13
DAI/USDC
1851984.561801533
13
2022-01-13
ETH/USDT
1505505.1113261068
28
2022-01-13
USDC/USDT
3397915.599336828
13
2022-01-13
USDT/ETH
1313777.840602782
24
2022-01-13
USDT/USDC
489583.980696389
7
2022-01-14
DAI/USDC
8340898.965147364
29
2022-01-14
ETH/USDT
729436.8146323687
24
2022-01-14
USDC/USDT
4431202.043703343
15
2022-01-14
USDT/ETH
1645406.3303531748
42
2022-01-14
USDT/USDC
1895303.1899436736
10
2022-01-15
DAI/USDC
3387933.5477849273
26
2022-01-15
ETH/USDT
690930.2995580438
33
2022-01-15
USDC/USDT
5429614.7614518665
28