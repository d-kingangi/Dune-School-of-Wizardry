-- evt_block_date
-- transaction_count
-- blockchain

SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'polygon' AS blockchain
FROM erc1155_polygon.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'polygon' AS blockchain
FROM erc1155_polygon.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'ethereum' AS blockchain
FROM erc1155_ethereum.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'ethereum' AS blockchain
FROM erc1155_ethereum.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'base' AS blockchain
FROM erc1155_base.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'base' AS blockchain
FROM erc1155_base.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'zora' AS blockchain
FROM erc1155_zora.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'zora' AS blockchain
FROM erc1155_zora.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'optimism' AS blockchain
FROM erc1155_optimism.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'optimism' AS blockchain
FROM erc1155_optimism.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'bnb' AS blockchain
FROM erc1155_bnb.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'bnb' AS blockchain
FROM erc1155_bnb.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'zksync' AS blockchain
FROM erc1155_zksync.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'zksync' AS blockchain
FROM erc1155_zksync.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'gnosis' AS blockchain
FROM erc1155_gnosis.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'gnosis' AS blockchain
FROM erc1155_gnosis.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'avalanche_c' AS blockchain
FROM erc1155_avalanche_c.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'avalanche_c' AS blockchain
FROM erc1155_avalanche_c.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'goerli' AS blockchain
FROM erc1155_goerli.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'goerli' AS blockchain
FROM erc1155_goerli.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'fantom' AS blockchain
FROM erc1155_fantom.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'fantom' AS blockchain
FROM erc1155_fantom.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'linea' AS blockchain
FROM erc1155_linea.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'linea' AS blockchain
FROM erc1155_linea.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'celo' AS blockchain
FROM erc1155_celo.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'celo' AS blockchain
FROM erc1155_celo.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'scroll' AS blockchain
FROM erc1155_scroll.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'scroll' AS blockchain
FROM erc1155_scroll.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'tron' AS blockchain
FROM erc1155_tron.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'tron' AS blockchain
FROM erc1155_tron.evt_transferbatch
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'optimism_legacy_ovm1' AS blockchain
FROM erc1155_optimism_legacy_ovm1.evt_transfersingle
GROUP BY
  1
UNION ALL
SELECT
  DATE(evt_block_time) AS evt_block_date,
  COUNT(DISTINCT evt_tx_hash) AS transaction_count,
  'optimism_legacy_ovm1' AS blockchain
FROM erc1155_optimism_legacy_ovm1.evt_transferbatch
GROUP BY
  1

  2022-06-16 00:00
26
tron
2022-06-22 00:00
27
tron
2021-12-06 00:00
1
tron
2022-03-15 00:00
2
tron
2024-03-07 00:00
6
tron
2022-09-26 00:00
1
tron
2022-07-02 00:00
2
tron
2024-04-26 00:00
1
tron
2022-02-27 00:00
2
tron
2022-07-17 00:00
1
tron
2021-03-17 00:00
9
tron
2023-10-06 00:00
3
tron
2022-05-24 00:00
5
tron
2024-01-09 00:00
5
tron
2021-10-27 00:00
1
tron
2023-06-14 00:00
3
tron
2020-02-16 00:00
1
tron
2021-04-12 00:00
1
tron
2019-08-11 00:00
1
tron
2023-10-23 00:00
13
tron
2021-11-09 00:00
5
tron
2019-08-26 00:00
1
tron
2019-06-18 00:00
1
tron
2023-12-29 00:00
2
tron
2023-06-29 00:00
5
tron