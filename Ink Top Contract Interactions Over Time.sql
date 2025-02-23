-- day
-- contract_address
-- interaction_count
-- unique_users
-- total_gas_used
-- daily_rank


WITH
    contract_activity AS (
        SELECT
            DATE_TRUNC('day', b.time) AS day,
            t.to AS contract_address,
            COUNT(*) AS interaction_count,
            COUNT(DISTINCT t."from") AS unique_users,
            SUM(t.gas_used) AS total_gas_used
        FROM
            ink.transactions AS t
            JOIN ink.blocks AS b ON t.block_number = b.number
        WHERE
            t.to IN (
                SELECT
                    address
                FROM
                    ink.contracts
            )
        GROUP BY
            1,
            2
    )
SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY
            day
        ORDER BY
            interaction_count DESC
    ) AS daily_rank
FROM
    (
        SELECT
            day,
            contract_address,
            interaction_count,
            unique_users,
            total_gas_used,
            ROW_NUMBER() OVER (
                PARTITION BY
                    day
                ORDER BY
                    interaction_count DESC
            ) AS daily_rank
        FROM
            contract_activity
    ) AS ranked_activity
WHERE
    daily_rank <= 10