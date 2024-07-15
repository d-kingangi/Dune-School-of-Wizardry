-- daily transaction count
-- cumulative transactions


SELECT DATE_TRUNC('day',block_time) 
    AS DATE, 
    Count(*) as Tx ,
    SUM(Count(*)) OVER (ORDER BY DATE_TRUNC('day',block_time)) AS Cumulative_Tx
FROM base.transactions
    WHERE to = 0xCF205808Ed36593aa40a44F10c7f7C2F67d4A4d4 .
GROUP BY 1
ORDER BY 1 DESC

