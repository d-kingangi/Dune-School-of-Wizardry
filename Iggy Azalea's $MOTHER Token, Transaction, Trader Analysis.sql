WITH firstTrade AS (
  SELECT
    trader_id,
    MIN(DATE(block_time)) AS firstTradeDay
  FROM
    dex_solana.trades
  WHERE
    token_bought_mint_address LIKE '3S8qX1MsMqRbiwKg2cQyx7nis1oHMgaCuc9c4VfvVdPN'
  GROUP BY
    trader_id
),
buyVol AS (
  SELECT
    DATE(block_time) AS day,
    t.trader_id AS user,
    MIN(ft.firstTradeDay) AS firstTradeDay,
    SUM(token_bought_amount) AS buyTokens,
    SUM(amount_usd) AS buyUsdVol,
    SUM(fee_usd) AS buyFees,
    COUNT(*) AS numTransactions
  FROM
    dex_solana.trades t
  LEFT JOIN
    firstTrade ft ON t.trader_id = ft.trader_id
  WHERE
    token_bought_mint_address LIKE '3S8qX1MsMqRbiwKg2cQyx7nis1oHMgaCuc9c4VfvVdPN'
  GROUP BY
    1, 2
),
dailyStats AS (
  SELECT
    day,
    CASE
      WHEN day = firstTradeDay THEN 'FirstTimeTrader'
      ELSE 'RecurringTrader'
    END AS traderType,
    SUM(buyTokens) AS totalBuyTokens,
    SUM(buyUsdVol) AS totalBuyUsdVol,
    SUM(buyFees) AS totalBuyFees,
    COUNT(DISTINCT user) AS uniqueTraders,
    SUM(numTransactions) AS totalTransactions
  FROM
    buyVol
  GROUP BY
    1, 2
),
cumulativeFirstTimers AS (
  SELECT
    day,
    traderType,
    totalBuyTokens,
    totalBuyUsdVol,
    totalBuyFees,
    uniqueTraders,
    totalTransactions,
    SUM(CASE WHEN traderType = 'FirstTimeTrader' THEN uniqueTraders ELSE 0 END) OVER (ORDER BY day) AS cumulativeFirstTimeTraders
  FROM
    dailyStats
)
SELECT
  day,
  traderType,
  totalBuyTokens,
  totalBuyUsdVol,
  totalBuyFees,
  uniqueTraders,
  totalTransactions,
  cumulativeFirstTimeTraders,
  cumulativeFirstTimeTraders - LAG(cumulativeFirstTimeTraders, 1, 0) OVER (ORDER BY day) AS rocCumulativeFirstTimers
FROM
  cumulativeFirstTimers
WHERE
  day >= CURRENT_DATE - INTERVAL '120' DAY
ORDER BY
  day, traderType;