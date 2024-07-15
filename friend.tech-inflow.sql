-- DATE
-- ethAmount
-- Inflow_USD
-- Cumulative_Inflow_ETH
-- Cumulative_Inflow_USD

WITH Friend AS (
  SELECT
    DATE_TRUNC('day', evt_block_time) AS DATE,
    CAST(SUM(ethAmount) AS DOUBLE) / 1e18 AS ethAmount
  FROM friendtech_base.FriendtechSharesV1_evt_Trade
  GROUP BY 1
),

Prices AS (
  SELECT
    DATE_TRUNC('day', minute) AS DATE,
    AVG(price) AS Price
  FROM prices.usd
  WHERE symbol='ETH'
  AND blockchain IS NULL 
  GROUP BY 1
)

SELECT
  a.DATE,
  ethAmount,
  ethAmount * b.Price AS Inflow_USD,
  SUM(ethAmount) OVER (ORDER BY a.DATE) AS Cumulative_Inflow_ETH,
  SUM(ethAmount * b.Price) OVER (ORDER BY a.DATE) AS Cumulative_Inflow_USD
FROM Friend a
LEFT JOIN Prices b ON a.DATE = b.DATE
ORDER BY a.DATE DESC;
