SELECT 
    -- rename the block_date column as DateTime
    block_date as DateTime,
    -- count the no. of rows as Number_of_Inscriptions
    Count(*) as Number_of_Inscription ,
    -- find sum of output_value column, represent the total as OutputBTC
    sum(output_value) as OutputBTC, 
    -- find sum of total fee as Fee
    sum(fee) as Fee
FROM bitcoin.transactions
WHERE 
    1 = 1  
    and 
    -- for blocks greater than height 779831
    block_height > 779831
AND 
    -- filter transactions where hex column has specified the hex patterns. % acts as wildcards
    cast(hex AS VARCHAR) LIKE '%0063036f726401%'
AND 
    cast(hex AS VARCHAR) LIKE '%6272632d3230%'
GROUP BY 1
ORDER BY 1 DESC