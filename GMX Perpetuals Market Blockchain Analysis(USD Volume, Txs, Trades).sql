--resultin columns

-- block_date
-- blockchain
-- total_trade_volume_in_usd
-- daily_transactions
-- daily_unique_traders


WITH
  combined_trades AS (
    SELECT
      block_date,
      blockchain,
      amount_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx.trades
    UNION ALL
    SELECT
      block_date,
      blockchain,
      volume_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx_arbitrum.perpetual_trades
    UNION ALL
    SELECT
      block_date,
      blockchain,
      volume_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx.perpetual_trades
    UNION ALL
    SELECT
      block_date,
      blockchain,
      volume_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx_avalanche_c.perpetual_trades
    UNION ALL
    SELECT
      block_date,
      blockchain,
      amount_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx_arbitrum.trades
    UNION ALL
    SELECT
      block_date,
      blockchain,
      amount_usd AS trade_volume_in_usd,
      tx_hash,
      tx_from
    FROM
      gmx_avalanche_c.trades
  ),
  daily_totals AS (
    SELECT
      block_date,
      blockchain,
      SUM(trade_volume_in_usd) AS total_trade_volume_in_usd
    FROM
      combined_trades
    GROUP BY
      block_date,
      blockchain
  ),
  daily_transactions AS (
    SELECT
      block_date,
      blockchain,
      COUNT(DISTINCT tx_hash) AS daily_transactions
    FROM
      combined_trades
    GROUP BY
      block_date,
      blockchain
  ),
  daily_unique_traders AS (
    SELECT
      block_date,
      blockchain,
      COUNT(DISTINCT tx_from) AS daily_unique_traders
    FROM
      combined_trades
    GROUP BY
      block_date,
      blockchain
  )
SELECT
  dt.block_date,
  dt.blockchain,
  dt.total_trade_volume_in_usd,
  dtx.daily_transactions,
  dut.daily_unique_traders
FROM
  daily_totals dt
  JOIN daily_transactions dtx ON dt.block_date = dtx.block_date
  AND dt.blockchain = dtx.blockchain
  JOIN daily_unique_traders dut ON dt.block_date = dut.block_date
  AND dt.blockchain = dut.blockchain
ORDER BY
  dt.block_date,
  dt.blockchain;