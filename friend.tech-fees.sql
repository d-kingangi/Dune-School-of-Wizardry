-- DATE
-- protocolEthAmount
-- Protocol_USD
-- Cumulative_protocolEthAmount
-- Cumulative_Protocol_USD

WITH Friend AS (
  SELECT
    DATE_TRUNC('day', evt_block_time) AS DATE,
    CAST(SUM(protocolEthAmount) AS DOUBLE) / 1e18 AS protocolEthAmount
  FROM friendtech_base.FriendtechSharesV1_evt_Trade
  GROUP BY 1
),

Prices AS (
  SELECT
    DATE_TRUNC('day', minute) AS DATE,
    AVG(price) AS Price
  FROM prices.usd
  WHERE symbol='ETH'
  GROUP BY 1
)

SELECT
  a.DATE,
  protocolEthAmount,
  protocolEthAmount * b.Price AS Protocol_USD,
  SUM(protocolEthAmount) OVER (ORDER BY a.DATE) AS Cumulative_protocolEthAmount,
  SUM(protocolEthAmount * b.Price) OVER (ORDER BY a.DATE) AS Cumulative_Protocol_USD
FROM Friend a
LEFT JOIN Prices b ON a.DATE = b.DATE
ORDER BY a.DATE DESC;
