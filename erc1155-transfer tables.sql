SELECT 
    *
FROM
erc1155_polygon.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_ethereum.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_polygon.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_ethereum.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_base.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_arbitrum.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_zora.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_optimism.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_base.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_arbitrum.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_bnb.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_zksync.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_optimism.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_gnosis.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_gnosis.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_bnb.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_avalanche_c.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_goerli.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_fantom.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_zksync.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_avalanche_c.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_celo.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_zora.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_fantom.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_scroll.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_linea.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_celo.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_linea.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_tron.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_tron.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_scroll.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_optimism_legacy_ovm1.evt_transfersingle

UNION ALL

SELECT 
    *
FROM
erc1155_optimism_legacy_ovm1.evt_transferbatch

UNION ALL

SELECT 
    *
FROM
erc1155_goerli.evt_transferbatch
