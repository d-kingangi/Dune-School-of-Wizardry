-- punk_id
-- listed_price_eth
-- listed_price_current_usd
-- total_eth_amount
-- total_usd_amount
-- total_trades_involved
-- highest_eth_amount
-- highest_usd_amount
-- latest_amount_usd

SELECT
  cl.punk_id AS punk_id,
  cl.listed_price_eth AS listed_price_eth,
  cl.listed_price_current_usd AS listed_price_current_usd,
  COALESCE(SUM(ce.eth_amount), 0) AS total_eth_amount,
  COALESCE(SUM(ce.usd_amount), 0) AS total_usd_amount,
  COUNT(DISTINCT ct.unique_trade_id) AS total_trades_involved,
  MAX(COALESCE(highest_eth_amount.eth_amount, 0)) AS highest_eth_amount,
  MAX(COALESCE(highest_usd_amount.usd_amount, 0)) AS highest_usd_amount,
  MAX(COALESCE(latest_trades.amount_usd, 0)) AS latest_amount_usd
FROM cryptopunks_ethereum.current_listings AS cl
LEFT JOIN cryptopunks_ethereum.all_events AS ce
  ON cl.punk_id = ce.punk_id
LEFT JOIN cryptopunks_ethereum.trades AS ct
  ON cl.punk_id = ct.token_id 
LEFT JOIN (
  SELECT
    punk_id,
    MAX(eth_amount) AS eth_amount
  FROM cryptopunks_ethereum.all_events
  GROUP BY
    punk_id
) AS highest_eth_amount
  ON cl.punk_id = highest_eth_amount.punk_id
LEFT JOIN (
  SELECT
    punk_id,
    MAX(usd_amount) AS usd_amount
  FROM cryptopunks_ethereum.all_events
  GROUP BY
    punk_id
) AS highest_usd_amount
  ON cl.punk_id = highest_usd_amount.punk_id
LEFT JOIN (
  SELECT
    token_id AS punk_id, 
    MAX(amount_usd) AS amount_usd
  FROM cryptopunks_ethereum.trades
  GROUP BY
    token_id
) AS latest_trades
  ON cl.punk_id = latest_trades.punk_id
GROUP BY
  cl.punk_id,
  cl.listed_price_eth,
  cl.listed_price_current_usd