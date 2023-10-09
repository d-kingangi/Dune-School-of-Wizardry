/* total Gooddollar tokens released by contract */
/* 0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A */

SELECT
  block_time,
  block_number,
  gas_used,
  hash
FROM celo.transactions
WHERE
  to = 0x62B8B11039FcfE5aB0C56E502b1C372A3d2a9c7A


