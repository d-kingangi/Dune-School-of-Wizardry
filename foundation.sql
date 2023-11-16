-- foundation nft marketplace
--foundation nft contract


SELECT project,
        token_id,
        amount_usd, 
        project_contract_address,
        tx_hash, tx_from, 
        unique_trade_id
FROM nft.trades
    WHERE
    nft_contract_address = 0x3B3ee1931Dc30C1957379FAc9aba94D1C48a5405
    LIMIT 100 --set limit