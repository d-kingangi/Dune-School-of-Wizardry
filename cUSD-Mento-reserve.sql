-- query to find cUSD held by Mento

with

wallet_address (address) as (
    values
    (0x246f4599eFD3fA67AC44335Ed5e749E518Ffd8bB), -- address for Custodian Celo Reserve
    (0xf4cab10dc19695aace14b7a16d7705b600ad5f73), -- address for cUSD in Curve Pool
    (0x87647780180b8f55980c7d3ffefe08a9b29e9ae1), -- address for cUSD in Multisig
    (0x9380fA34Fd9e4Fd14c06305fd7B6199089eD4eb9)  -- address for Celo Reserve
),

transfer_raw as (
    select "to" as address, cast(sum(value) as double) as amount
    from erc20_celo.evt_Transfer 
    where contract_address = 0x765de816845861e75a25fca122bb6898b8b1282a
      and "to" in (select address from wallet_address)
    group by 1
    
    union all
    
    select "from" as address, -1 * (cast(sum(value) as double)) as amount
    from erc20_celo.evt_Transfer 
    where contract_address = 0x765de816845861e75a25fca122bb6898b8b1282a 
      and "from" in (select address from wallet_address)
    group by 1
),

balance as (
    select address, sum(amount) / 1e18 as balance_amount
    from transfer_raw
    group by 1
)

select
  address,
  balance_amount
from balance
order by 2 desc
