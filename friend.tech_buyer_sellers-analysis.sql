
-- DATE
-- cumulative_unique_buyers
-- cumulative_unique_sellers

WITH Buyers AS (
  SELECT DISTINCT
    trader AS Buyer,
    MIN(evt_block_time) AS first_date
  FROM friendtech_base.FriendtechSharesV1_evt_Trade
  WHERE isBuy = TRUE AND shareAmount > CAST(0 AS uint256) -- Filter valid buy trades
  GROUP BY 1
),
Seller AS (
  SELECT DISTINCT
    trader AS Seller,
    MIN(evt_block_time) AS first_date
  FROM friendtech_base.FriendtechSharesV1_evt_Trade
  WHERE isBuy = FALSE AND shareAmount > CAST(0 AS uint256) -- Filter valid sell trades
  GROUP BY 1
),
uniq_buyers AS (
  SELECT
    DATE_TRUNC('day', first_date) AS DATE,
    COUNT(Buyer) OVER (ORDER BY DATE_TRUNC('day', first_date)) AS cumulative_unique_buyers
  FROM Buyers
),
uniq_sellers AS (
  SELECT
    DATE_TRUNC('day', first_date) AS DATE,
    COUNT(Seller) OVER (ORDER BY DATE_TRUNC('day', first_date)) AS cumulative_unique_sellers
  FROM Seller
)
SELECT
  a.DATE,
  cumulative_unique_buyers,
  cumulative_unique_sellers
FROM uniq_buyers a
LEFT JOIN uniq_sellers b ON a.DATE = b.DATE
ORDER BY a.DATE DESC;
