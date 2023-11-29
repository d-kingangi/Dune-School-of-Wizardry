with
  ethereum as (
    select
      date_trunc('day', block_time) as time,
      blockchain,
      case
        when version = '1' then 'Uniswap V1'
        when version = '2' then 'Uniswap V2'
        when version = '3' then 'Uniswap V3'
        else null
      end as version,
      sum(amount_usd) as volume,
      count(distinct taker) as unique_trader,
      AVG(amount_usd) as avg_usd_volume,
      approx_percentile(amount_usd, 0.5) as median_trade_size
    from
      dex.trades
    where
      project = 'uniswap'
      and blockchain = 'ethereum'
      -- and block_time >= cast('2023-01-01' as timestamp)
    group by
      1,
      2,
      3
  )
select
  time,
  version,
  sum(volume) as volume,
  sum(unique_trader) as unique_trader
from
  (
    select
      *
    from
      ethereum
  )
group by
  1,
  2