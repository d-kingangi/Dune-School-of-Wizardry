select
    -- truncate time interval, blocktime into  date_trunc
    date_trunc('{{Time interval}}', block_time) as time,
    -- find unique sender and receiver addresses 
    count(distinct "from") unique_senders_addresses,
    count(distinct "to") unique_receivers_addresses
from celo.transactions
-- for succesful transactions
where success = true
-- block_time column in the celo.transactions table i.e transction timestamp.
    Truncate the current timestamp, now(), to specified time interval i.e {{Day}} 
    subtract a time interval from the truncated timestamp. In this case, i.e {{720}} days.
    */
and block_time >= DATE_TRUNC('{{Day}}',now()) - interval '{{720}}' DAY
group by 1 
order by 1 desc