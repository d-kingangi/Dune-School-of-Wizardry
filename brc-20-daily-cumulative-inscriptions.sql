-- finding daily and cumulative brc-20 minted


WITH ord AS (
    SELECT
        DATE_TRUNC('day', block_time) AS date,
        COUNT(*) AS Daily_Inscriptions,
        SUM(COUNT(*)) OVER (ORDER BY DATE_TRUNC('day', block_time)) AS Total_Inscriptions
    FROM
        bitcoin.transactions
    WHERE
        block_height >= 773780
        AND CAST(hex AS VARCHAR) LIKE '%0063036f726401%'
    GROUP BY
        1
)
SELECT
    *
FROM
    ord
ORDER BY
    date DESC;
