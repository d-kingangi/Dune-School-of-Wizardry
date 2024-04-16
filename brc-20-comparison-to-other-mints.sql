SELECT 
    DATE_TRUNC('week', block_date) AS time,
    (CASE 
        WHEN CAST(hex AS VARCHAR) NOT LIKE '%0063036f726401%' THEN '1. non-ordinals'
        WHEN CAST(hex AS VARCHAR) LIKE '%6272632d3230%' THEN '3. brc-20'
        WHEN CAST(hex AS VARCHAR) LIKE '%6f72632d3230%' THEN '4. orc-20'
        WHEN CAST(hex AS VARCHAR) LIKE '%7372632d3230%' THEN '5. src-20'
        WHEN CAST(hex AS VARCHAR) LIKE '%6272632d373231%' THEN '6. brc-721'
        ELSE '2. other-ordinals' 
    END) AS type, 
    COUNT(*) AS total_txs, 
    SUM(fee) AS fee,
    SUM(size) AS size
FROM 
    bitcoin.transactions
WHERE 
    DATE(block_date) >= DATE(CAST('2023-01-01' AS TIMESTAMP))
GROUP BY 
    1, 2
ORDER BY 
    1, 3 DESC;
