--finding the most traded currency pair on the Celo blockchain
-- week_start
-- categorized_token_pair
-- total_weekly_volume
-- total_weekly_users


WITH weekly_trades AS (
  SELECT
    DATE_TRUNC('week', block_time) AS week_start,
    token_pair,
    SUM(amount_usd) AS total_volume,
    COUNT(DISTINCT tx_from) AS unique_users
  FROM dex.trades AS dex_trades
  WHERE
    blockchain = 'celo'
  GROUP BY
    1,
    token_pair
), 
ranked_trades AS (
  SELECT
    week_start,
    token_pair,
    total_volume,
    unique_users,
    RANK() OVER (PARTITION BY week_start ORDER BY total_volume DESC) AS rank
  FROM weekly_trades
),
categorized_trades AS (
  SELECT
    week_start,
    CASE 
      WHEN rank <= 20 THEN token_pair
      ELSE 'Other (> Top 20)' 
    END AS categorized_token_pair,
    total_volume,
    unique_users
  FROM ranked_trades
)
SELECT
  week_start,
  categorized_token_pair,
  SUM(total_volume) AS total_weekly_volume,
  SUM(unique_users) AS total_weekly_users
FROM 
  categorized_trades
GROUP BY
  week_start,
  categorized_token_pair
ORDER BY
  week_start, 
  categorized_token_pair;


-- week_start
-- categorized_token_pair
-- total_weekly_volume
-- total_weekly_users
