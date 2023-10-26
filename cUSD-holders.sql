-- query to find cUSD token holders 

with transfers as (
   select "to" as account, cast(amount as int256) as amount from compound_v2_ethereum.cErc20_evt_Transfer where contract_address = 0x39aa39c021dfbae8fac545936693ac917d5e7563
   union all
   select "from" as account, -cast(amount as int256) as amount from compound_v2_ethereum.cErc20_evt_Transfer where contract_address = 0x39aa39c021dfbae8fac545936693ac917d5e7563
),
balances as (
    select sum(amount / 1e8 * 0.0228152918707633) as balance, account from transfers
    group by account
)
select balance, account from balances where balance > 1000000 and account not in 
            (0x97D868b5C2937355Bf89C5E5463d52016240fE86,
            0x614e57c57e6da7b86bea5be977a95b0f94bf43eb,
            0xdf23512db4299d67147361987af05ee828d82e41,
            0x8888882f8f843896699869179fb6e4f7e3b58888,
            0x54229adf92559c5ef9cf7b78224172dcccc0a486,
            0x38ba032db2e9a69ba3bc9062639164965b3bec74,
            0x59da155594d064cd99cca96c757ca37688eaf39a,
            0xa2b47e3d5c44877cca798226b7b8118f9bfb7a56,
            0xc5903d67f890e37a2b1a0b542a9ae0c5660763ac,
            0x78bde1fe54d93d6bc483e160205f4b7e1c7ca5fb,
            0x14647b01537939a49b6241dbd4b46b11cd8323eb,
            0xc06d0f5d8d06bac8dc7cae44c4a2dfcedcafb7a5,
            0xf014fef41ccb703975827c8569a3f0940cfd80a4,
            0xd55684f4369040c12262949ff78299f2bc9db735
            ) order by balance DESC