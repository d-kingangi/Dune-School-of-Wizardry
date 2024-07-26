-- period
-- amount
-- tx
-- senders
-- receivers
-- tx_100
-- tx_1000
-- tx_10000
-- tx_100000
-- tx_1000000
-- tx_1000000p
-- amt_100
-- amt_1000
-- amt_10000
-- amt_100000
-- amt_1000000
-- amt_1000000p



with tx as (
    select date_trunc('day', block_time) as period, "from", "to", value as amount,
        case when value < 100*1e6 then 100
            when value < 1000*1e6 then 1000
            when value < 10000*1e6 then 10000
            when value < 100000*1e6 then 100000
            when value < 1000000*1e6 then 1000000
            else -1 end as bucket
    from sepolia.transactions
    where block_time >= date'2022-01-01'
        and block_time  < date_trunc('day', current_date)
), 
sepolia as (
    select period, sum(amount)/1e6 as amount, count(1) as tx, 
        count(distinct "from") as senders, count(distinct "to") as receivers, 
        sum(case when bucket = 100 then 1 else 0 end) as tx_100,
        sum(case when bucket = 1000 then 1 else 0 end) as tx_1000,
        sum(case when bucket = 10000 then 1 else 0 end) as tx_10000,
        sum(case when bucket = 100000 then 1 else 0 end) as tx_100000,
        sum(case when bucket = 1000000 then 1 else 0 end) as tx_1000000,
        sum(case when bucket = -1 then 1 else 0 end) as tx_1000000p,
        sum(case when bucket = 100 then amount else 0 end)/1e6 as amt_100,
        sum(case when bucket = 1000 then amount else 0 end)/1e6 as amt_1000,
        sum(case when bucket = 10000 then amount else 0 end)/1e6 as amt_10000,
        sum(case when bucket = 100000 then amount else 0 end)/1e6 as amt_100000,
        sum(case when bucket = 1000000 then amount else 0 end)/1e6 as amt_1000000,
        sum(case when bucket = -1 then amount else 0 end)/1e6 as amt_1000000p
    from tx
    group by 1
)
select * 
from sepolia
order by period desc