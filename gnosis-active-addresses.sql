--active addresses in the last 24 hrs

SELECT 
    COUNT(DISTINCT "from") AS total
FROM 
    gnosis.transactions 
    WHERE 
    block_time > (NOW() - interval '1' day)