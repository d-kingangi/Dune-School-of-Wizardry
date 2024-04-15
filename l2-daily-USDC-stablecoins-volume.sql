--find the volume of USDC stablecoin within the layer 2 networks
--Celo, Polygon, optimism, arbitrum, base



with transfers as ( --USDC transfers on selected blockchains
    select 
        evt_block_time,
        blockchain,
        contract_address,
        "from",
        "to",
        evt_tx_hash,
        value
    from evms.erc20_transfers
    where 
        (blockchain = 'avalanche_c' and contract_address = 0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E)
        or (blockchain = 'polygon' and contract_address = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174)
        or (blockchain = 'optimism' and contract_address = 0x7F5c764cBc14f9669B88837ca1490cCa17c31607)
        or (blockchain = 'arbitrum' and contract_address = 0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8
        )
),

total_supply as ( --daily USDC total supply on selected chains
    select
        date,
        blockchain,
        sum(amount) over (partition by blockchain order by date) as total_supply
    from (
        --daily USDC minted
        select
            date_trunc('day', evt_block_time) as date,
            blockchain,
            sum(value/1e6) as amount
        from transfers
        where "from" = 0x0000000000000000000000000000000000000000
        group by 1,2
        union all
        --daily USDC burnt
        select
            date_trunc('day', evt_block_time) as date,
            blockchain,
            -sum(value/1e6) as amount
        from transfers
        where "to" = 0x0000000000000000000000000000000000000000
        group by 1,2
    )
),

total_supply_last6months as (
    select *
    from total_supply
    where date >= now() - interval '6' month
),

aggregates as (
    select
    ts.date,
    ts.blockchain,
    ts.total_supply,
    count(evt_tx_hash) as transfer_count,
    sum(value)/1e6 as transfer_volume,
    sum(value)/1e6 / ts.total_supply as transfer_velocity,
    sum(value)/1e6 / count(evt_tx_hash) as volume_per_transfer
from total_supply_last6months ts
    left join transfers tr
        on date_trunc('day', tr.evt_block_time) = ts.date
        and tr.blockchain = ts.blockchain
where
    "to" != 0x0000000000000000000000000000000000000000 --exclude burn tx
    and "from" != 0x0000000000000000000000000000000000000000 --exclude mint tx
group by 1,2,3
)

select
    date,
    blockchain,
    sum(transfer_count) over (partition by blockchain order by date asc rows between 6 preceding and current row) as transfer_count_7dm,
    sum(transfer_volume) over (partition by blockchain order by date asc rows between 6 preceding and current row) as transfer_volume_7dm,
    avg(transfer_velocity) over (partition by blockchain order by date asc rows between 6 preceding and current row) as transfer_velocity_7dma,
    avg(volume_per_transfer) over (partition by blockchain order by date asc rows between 6 preceding and current row) as volume_per_transfer_7dma
from aggregates