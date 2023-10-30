with eth as (select value/1e18 as value, hash, block_time
from ethereum.transactions as t1
where "to"=0x2a3DD3EB832aF982ec71669E178424b10Dca2EDe
and substring(cast(data as varchar),1,10)='0xcd586579'), 

erc20 as (
    select (cast(t1.value as double)/power(10,t2.decimals))*t2.price as value, evt_block_time as block_time, t2.symbol 
    from erc20_ethereum.evt_Transfer as t1 
    left join prices.usd as t2 on t1.contract_address=t2.contract_address and date_trunc('minute', t1.evt_block_time)=t2.minute and blockchain='ethereum'
    where t1.evt_tx_hash in(select hash from eth) and to=0x2a3DD3EB832aF982ec71669E178424b10Dca2EDe
), 

eth_value as (
    select (cast(t1.value as double))*t2.price as value, block_time, 'ETH' as symbol
    from eth as t1 
    left join prices.usd as t2 on  date_trunc('minute', t1.block_time)=t2.minute and blockchain='ethereum' and symbol='WETH'
    where t1.value>0 ) 

select symbol, sum(value) as value, count(*) as txs
from(
select * from erc20 
union all 
select * from eth_value) as t1 
group by 1
having sum(value)>0
order by 2 desc