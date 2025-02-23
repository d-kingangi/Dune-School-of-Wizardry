SELECT
    DATE_TRUNC('day', b.time) AS day,
    COUNT(DISTINCT t."from") AS daily_active_addresses,
    COUNT(
        DISTINCT CASE
            WHEN t."to" IN (
                SELECT
                    address
                FROM
                    ink.contracts
            ) THEN t."from"
        END
    ) AS contract_users,
    COUNT(DISTINCT c.address) AS new_contracts,
    SUM(t.gas_used) AS total_gas_used,
    COUNT(*) AS total_transactions
FROM
    ink.blocks AS b
    LEFT JOIN ink.transactions AS t ON b.number = t.block_number
    LEFT JOIN ink.contracts AS c ON c.created_at BETWEEN DATE_TRUNC('day', b.time) AND DATE_TRUNC('day', b.time)  + INTERVAL '1' DAY
GROUP BY
    1
ORDER BY
    1 DESC