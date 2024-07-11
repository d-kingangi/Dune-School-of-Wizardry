--active addresses in the last 30 days


SELECT 
    COUNT(DISTINCT "from") AS total
FROM 
    gnosis.transactions
    WHERE 
    block_time > now() - INTERVAL '30' day;