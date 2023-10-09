SELECT
  txid,
  fee_satoshis,
  confirmations,
  timestamp
FROM
  bitcoin.transactions
WHERE
  fee_satoshis > 10000
  AND confirmations = 0
  AND TIMESTAMPDIFF (HOUR, timestamp, NOW()) > 5