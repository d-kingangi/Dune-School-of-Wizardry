--query to find unique user who've bridged tokens to Polygon's zkEVM

with
  all_eth_polygon_zkevm as (
      select date_trunc('day', block_time) as block_date,
      count(*) as tx_count,
      count(distinct "from") as users
    FROM
      ethereum.transactions
    WHERE
      "to" = 0x2a3DD3EB832aF982ec71669E178424b10Dca2EDe --bridge contract
      and substring(cast(data as varchar),1,10)='0xcd586579'
      and success = true
    group by 1
    order by 1
  )
select
  block_date,
  tx_count,
  users
from
  all_eth_polygon_zkevm
order by block_date