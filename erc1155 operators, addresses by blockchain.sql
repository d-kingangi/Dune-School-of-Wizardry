-- evt_block_date
-- distinct_operators
-- distinct_from_addresses
-- distinct_to_addresses
-- blockchain

-- Polygon Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'polygon' AS blockchain
FROM 
    erc1155_polygon.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Polygon Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'polygon' AS blockchain
FROM 
    erc1155_polygon.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Ethereum Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'ethereum' AS blockchain
FROM 
    erc1155_ethereum.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Ethereum Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'ethereum' AS blockchain
FROM 
    erc1155_ethereum.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Base Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'base' AS blockchain
FROM 
    erc1155_base.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Base Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'base' AS blockchain
FROM 
    erc1155_base.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Zora Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'zora' AS blockchain
FROM 
    erc1155_zora.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Zora Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'zora' AS blockchain
FROM 
    erc1155_zora.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Optimism Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'optimism' AS blockchain
FROM 
    erc1155_optimism.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Optimism Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'optimism' AS blockchain
FROM 
    erc1155_optimism.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- BNB Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'bnb' AS blockchain
FROM 
    erc1155_bnb.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- BNB Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'bnb' AS blockchain
FROM 
    erc1155_bnb.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- zkSync Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'zksync' AS blockchain
FROM 
    erc1155_zksync.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- zkSync Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'zksync' AS blockchain
FROM 
    erc1155_zksync.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Gnosis Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'gnosis' AS blockchain
FROM 
    erc1155_gnosis.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Gnosis Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'gnosis' AS blockchain
FROM 
    erc1155_gnosis.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Avalanche_c Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'avalanche_c' AS blockchain
FROM 
    erc1155_avalanche_c.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Avalanche_c Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'avalanche_c' AS blockchain
FROM 
    erc1155_avalanche_c.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Goerli Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'goerli' AS blockchain
FROM 
    erc1155_goerli.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Goerli Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'goerli' AS blockchain
FROM 
    erc1155_goerli.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Fantom Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'fantom' AS blockchain
FROM 
    erc1155_fantom.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Fantom Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date,
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'fantom' AS blockchain
FROM 
    erc1155_fantom.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Linea Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'linea' AS blockchain
FROM 
    erc1155_linea.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Linea Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date,
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'linea' AS blockchain
FROM 
    erc1155_linea.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Celo Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'celo' AS blockchain
FROM 
    erc1155_celo.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Celo Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'celo' AS blockchain
FROM 
    erc1155_celo.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Scroll Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'scroll' AS blockchain
FROM 
    erc1155_scroll.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Scroll Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'scroll' AS blockchain
FROM 
    erc1155_scroll.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Tron Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'tron' AS blockchain
FROM 
    erc1155_tron.evt_transfersingle
GROUP BY 
    1

UNION ALL

-- Tron Transferbatch
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'tron' AS blockchain
FROM 
    erc1155_tron.evt_transferbatch
GROUP BY 
    1

UNION ALL

-- Optimism Legacy OVM1 Transfersingle
SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'optimism_legacy_ovm1' AS blockchain
FROM 
    erc1155_optimism_legacy_ovm1.evt_transfersingle
GROUP BY 
    1

UNION ALL

SELECT 
    DATE(evt_block_time) AS evt_block_date, 
    COUNT(DISTINCT operator) AS distinct_operators,
    COUNT(DISTINCT "from") AS distinct_from_addresses,
    COUNT(DISTINCT "to") AS distinct_to_addresses,
    'optimism_legacy_ovm1' AS blockchain
FROM 
    erc1155_optimism_legacy_ovm1.evt_transferbatch
GROUP BY 
    1;


2023-11-08 00:00
1
1
1
tron
2023-10-23 00:00
1
1
1
tron
2024-03-07 00:00
1
1
1
tron
2023-10-06 00:00
1
1
1
tron
2023-09-21 00:00
1
1
1
tron
2024-04-20 00:00
1
2
1
tron
2024-02-28 00:00
1
1
1
tron
2023-05-31 00:00
1
1
1
tron
2024-04-16 00:00
1
1
1
tron
2024-03-10 00:00
1
2
1
tron
2024-03-21 00:00
1
1
1
tron
2024-04-17 00:00
1
1
1
tron
2023-10-05 00:00
1
1
1
tron
2024-03-15 00:00
1
1
1
tron
2023-11-10 00:00
1
2
1
tron
2023-10-10 00:00
1
1
1
tron
2024-01-05 00:00
1
1
1
tron
2024-01-23 00:00
1
1
1
tron
2023-06-06 00:00
1
1
1
tron
2024-04-07 00:00
1
1
1
tron
2023-09-29 00:00
1
1
1
tron
2023-10-26 00:00
1
1
1
tron
2024-04-25 00:00
1
1
1
tron
2022-08-24 00:00
1
1
2
tron
2024-01-17 00:00
1
1
1
tron

2024-02-17 00:00
1
1
1
tron
2024-03-14 00:00
1
5
1
tron
2024-03-28 00:00
1
1
1
tron
2024-04-24 00:00
1
1
1
tron
2024-04-12 00:00
1
1
1
tron
2024-05-23 00:00
1
2
1
tron
2024-03-24 00:00
1
1
1
tron
2024-02-29 00:00
1
1
1
tron
2023-10-21 00:00
1
1
1
tron
2024-03-31 00:00
1
1
1
tron
2024-01-27 00:00
1
1
1
tron
2023-11-09 00:00
1
1
1
tron
2023-10-08 00:00
1
1
1
tron
2024-01-12 00:00
1
1
1
tron
2023-09-29 00:00
2
3
5
tron
2020-02-28 00:00
1
1
1
tron
2020-02-16 00:00
1
1
1
tron
2023-06-14 00:00
1
1
3
tron
2021-04-12 00:00
1
1
1
tron
2024-01-09 00:00
1
1
2
tron
2022-05-24 00:00
2
3
5
tron
2021-10-27 00:00
1
1
1
tron
2021-05-13 00:00
1
1
1
tron
2021-03-22 00:00
2
2
3
tron
2021-01-06 00:00
1
1
2
tron

2021-04-04 00:00
1
1
3
tron
2023-07-21 00:00
1
1
1
tron
2020-11-04 00:00
1
1
1
tron
2021-08-26 00:00
1
1
30
tron
2021-09-14 00:00
4
4
5
tron
2023-10-21 00:00
2
2
6
tron
2022-01-24 00:00
1
1
1
tron
2022-08-10 00:00
1
1
1
tron
2020-02-10 00:00
1
1
1
tron
2023-09-26 00:00
1
1
1
tron
2024-05-07 00:00
1
1
1
tron
2021-05-03 00:00
1
1
1
tron
2024-01-19 00:00
1
1
1
tron
2020-02-23 00:00
1
1
1
tron
2024-03-24 00:00
1
1
2
tron
2023-07-20 00:00
1
1
1
tron
2024-02-27 00:00
1
1
1
tron
2022-10-04 00:00
2
2
2
tron
2022-09-05 00:00
1
3
1
tron
2021-12-09 00:00
1
1
1
tron
2021-04-07 00:00
1
1
1
tron
2021-04-10 00:00
1
1
7
tron
2021-03-15 00:00
3
3
14
tron
2021-04-13 00:00
1
1
1
tron
2020-06-07 00:00
1
1
1
tron





