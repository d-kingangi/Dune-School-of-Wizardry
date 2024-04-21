with
  address as (
    select
      count(distinct addresses) as active_address
    from
      (
        select
          "from" as addresses
        from
          celo.transactions
        union all
        select
          "to" as address
        from
          celo.transactions
      )
  ),
  contracts as (
    select
      sum(contracts_created) as contracts_create,
      sum(contracts_suicide) as contracts_suicide,
      sum(contracts_created) + sum(contracts_suicide) as total_contracts
    from
      (
        select
          case
            when type = 'create' then count(distinct address)
            else 0
          end as contracts_created,
          case
            when type = 'suicide' then count(distinct address)
            else 0
          end as contracts_suicide
        from
          celo.traces
        group by
          type
      )
  )
select
  active_address,
  contracts_create,
  contracts_suicide,
  total_contracts
from
  address
  join contracts on true