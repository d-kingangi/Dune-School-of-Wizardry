-- block_date
-- total_value_moved
-- total_gas_cost
-- total_gas_used

SELECT
    block_date,
    SUM(value) AS total_value_moved,  
    SUM(gas_price * gas_used) AS total_gas_cost,  
    SUM(gas_used) AS total_gas_used  
FROM
    tron.transactions
GROUP BY
    block_date
ORDER BY
    block_date DESC; 
