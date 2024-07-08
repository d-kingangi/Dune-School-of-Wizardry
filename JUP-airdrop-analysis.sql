WITH
    CLAIM_TXS AS (
        
        SELECT
            id
        FROM
            solana.transactions
        WHERE
            block_time >= TIMESTAMP '2024-01-31 13:00'
        AND
            contains(account_keys, 'meRjbQXFNf5En86FXT2YPz1dQzLj4Yb3xK8u1MVgqpb')
        AND
            contains(account_keys, 'JUP6LkbZbjS1jKKwapdHNy74zcZ3tLUZoi5QNyVTaV4') = false
        AND
            success = true
    ),
    CLAIM_ACTIVITY AS (
        SELECT
            block_time,
            id,
            token_balance_owner,
            post_token_balance,
            pre_token_balance,
            token_balance_change
        FROM
            solana.account_activity
        INNER JOIN
            CLAIM_TXS
        ON
            id = tx_id
        WHERE
            block_time >= TIMESTAMP '2024-01-31 13:00'
        AND
            token_balance_change > 0
        ORDER BY
            1 DESC
    ) 
SELECT
    SUM(token_balance_change) AS JUP_Claimed
FROM
    CLAIM_ACTIVITY
