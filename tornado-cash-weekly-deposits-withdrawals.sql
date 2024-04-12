--finding weekly deposits and withdrawals on the Tornado Cash contract address 

WITH
  deposits AS (
    SELECT
      block_time,
      "from"
    FROM
      ethereum.traces AS trs
    WHERE
      "to" IN (
        SELECT DISTINCT
          contract_address
        FROM
          tornado_cash_ethereum.eth_call_deposit
        UNION ALL
        SELECT
          0x905b63Fff465B9fFBF41DeA908CEb12478ec7601
        UNION ALL
        SELECT
          0xd90e2f925da726b50c4ed8d0fb90ad053324f31b
        UNION ALL
        SELECT
          0x722122df12d4e14e13ac3b6895a86e84145b6967
      )
      AND value > 0
      AND tx_success
  )
SELECT
  DATE_TRUNC('week', block_time) AS time,
  COUNT(DISTINCT "from") AS users
FROM
  deposits
GROUP BY
  1
ORDER BY
  1 DESC