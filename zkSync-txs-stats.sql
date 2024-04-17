--finding facts on transactions in the zkSync network 
-- i.e, successful transactions, failed tx, sender addresses and reciever addresses


SELECT
  DATE_TRUNC('day', block_time) AS Day,
  COUNT(
    CASE
      WHEN success = true THEN hash
      ELSE NULL
    END
  ) AS success,
  COUNT(
    CASE
      WHEN success = false THEN hash
      ELSE NULL
    END
  ) AS fail,
  COUNT(DISTINCT "from") AS senders,
  COUNT(DISTINCT "to") AS receivers
FROM
  zksync.transactions
GROUP BY
  1