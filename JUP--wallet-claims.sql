SELECT
    COUNT(DISTINCT signer) AS distinct_signers
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
