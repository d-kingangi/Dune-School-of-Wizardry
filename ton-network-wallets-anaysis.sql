-- new_wallets_created
-- cum_new_wallets
-- day
-- token_price


WITH
  new_transfers AS (
    SELECT
      to AS wallet,
      MIN(evt_block_time) AS time
    FROM
      erc20_ethereum.evt_Transfer
    WHERE
      contract_address = 0x582d872A1B094FC48F5DE31D3B73F2D9bE47def1
    GROUP BY
      1
  ),
  new_wallets AS (
    SELECT
      COUNT(*) AS new_wallets,
      DATE_TRUNC('day', time) AS day
    FROM
      new_transfers
    GROUP BY
      2
  ),
  prices AS (
    SELECT
      AVG(price) AS price,
      DATE_TRUNC('day', minute) AS day
    FROM
      prices.usd
    WHERE
      contract_address = 0x582d872A1B094FC48F5DE31D3B73F2D9bE47def1
      AND blockchain = 'ethereum'
      AND minute > NOW() - INTERVAL '365' day
    GROUP BY
      2
  )
SELECT
  a.new_wallets AS new_wallets_created,
  SUM(a.new_wallets) OVER (
    ORDER BY
      a.day NULLS FIRST
  ) AS cum_new_wallets,
  a.day AS day,
  b.price AS token_price
FROM
  new_wallets AS a
  LEFT JOIN prices AS b ON a.day = b.day
WHERE
  a.day > NOW() - INTERVAL '30' day
ORDER BY
  a.day DESC