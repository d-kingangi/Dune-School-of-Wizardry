--query to find total stETH(staked Ethereum) on Lido Finance over time

SELECT
  day AS "Date",
  SUM(dailyMinted) OVER (
    ORDER BY
      day
  ) AS "Total supply"
FROM
  (
    SELECT
      DATE_TRUNC('day', evt_block_time) AS day,
      SUM(value / CAST(1e18 AS DOUBLE)) AS dailyMinted
    FROM
      erc20_ethereum.evt_Transfer
    WHERE
      contract_address = 0xae7ab96520de3a18e5e111b5eaab095312d7fe84
      AND "from" = 0x0000000000000000000000000000000000000000
    GROUP BY
      1
  ) AS subquery