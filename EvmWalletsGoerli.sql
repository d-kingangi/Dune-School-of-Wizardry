/* query to find unique wallets successfully created on the Goerli testnet*/

select 
    date_trunc('{{Time interval}}', block_time) as time,
    count(distinct "from") unique_senders_addresses,
    count(distinct "to") unique_receivers_addresses
from goerli.transactions
where success = true
and block_time >= DATE_TRUNC('{{Time interval}}',now()) - interval '{{Trading Num Days}}' DAY
group by 1 
order by 1 desc