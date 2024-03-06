
WITH
  WalletTotals AS (
    SELECT
      tx_to AS wallet_address,
      SUM(amount_usd) AS total_received_amount
    FROM
      magiceden.trades
    GROUP BY
      tx_to
  )
SELECT
  wallet_address
FROM
  WalletTotals
ORDER BY
  total_received_amount DESC
LIMIT
  30

--   wallet_address
-- 0xdef1c0ded9bec7f1a1670819833240f027b25eff
-- 0x5ebc127fae83ed5bdd91fc6a5f5767e259df5642
-- 0x5e06c349a4a1b8dde8da31e0f167d1cb1d99967c
-- 0xef0b56692f78a44cf4034b07f80204757c31bcc9
-- 0xc2c862322e9c97d6244a3506655da95f05246fd8
-- 0xbf7f4302d1b34adc99d22b2a0ee90e9d26890d39
-- 0x1e5ba9f47d296e984ee94ae7ae91eb81cb80370d
-- 0x81496a6a1da3670729d05b0b3e1a410a81c8439f
-- 0x779c4ad68c7b87aa85d578b88260bc602ec52b7c
-- 0x79ce8f93063f8be4573a58f250b003859ebb7a24
-- 0x37e894d1dda653c13f36a6933b7ee51c7e499196
-- 0x4d58e002238ce8a2eae813557231eee86548fdd2
-- 0x3c19b92e69696ef72b42118d74cb2af10f864556
-- 0xbb3cae53b1d22424b29e025cda772e54a7c7ef99
-- 0x86dbd1ebc38d4d9dca2fc2d99c8eead55de3d13b
-- 0xd496382e5e2b85cf90bb0c7c91a003824ece9fe3
-- 0x11c3fd930b08df62be6915e1ce378b9c2fd3ad5b
-- 0xc27e8ad5133775e7d78062fef13be5510ee25a17
-- 0x7ab3ee2ebd1a30fad8206c193d8e5b742615b211
-- 0x738c63b5e8b36c3ed8d2d9cf9276fecce34b91c7
-- 0xa68fb80a4b7dc5408aa80a01def98340687e2ed6
-- 0xccadf28d9c74c8d412feecd86ea9b0a9ceff1b28
-- 0x375f6b0cd12b34dc28e34c26853a37012c24dde5
-- 0x0e3599b8a28fcfc76bd48b9554e20efaf2b1baaa
-- 0x69cfc5f53a55565f2097a66daa228eeea690425d