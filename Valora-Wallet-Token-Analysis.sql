-- token
-- total_amount
-- unique_beneficiaries
-- unique_depositors

WITH AllEvents AS (
    SELECT
        'Deposited' AS event_type,
        token,
        amount,
        beneficiary,
        depositor
    FROM valora_celo.WalletJumpstart_evt_ERC20Deposited
    UNION ALL
    SELECT
        'Reclaimed' AS event_type,
        token,
        amount,
        beneficiary,
        sentTo AS depositor
    FROM valora_celo.WalletJumpstart_evt_ERC20Reclaimed
)

SELECT
    token,
    SUM(amount) AS total_amount,
    COUNT(DISTINCT beneficiary) AS unique_beneficiaries,
    COUNT(DISTINCT depositor) AS unique_depositors
FROM AllEvents
GROUP BY token
ORDER BY token;


-- token
-- total_amount
-- unique_beneficiaries
-- unique_depositors

0x173234922eb27d5138c5e481be9df5261faed450
520903385535666546
2
2
0x32a9fe697a32135bfd313a6ac28792dae4d9979d
10000000000000000
1
1
0x46c9757c5497c5b1f2eb73ae79b6b67d119b0b58
51660005370720800000
2
2
0x471ece3750da237f93b8e339c536989b8978a438
1192205236433350614866
158
122
0x48065fbbe25f71c9282ddf5e1cd6d6a887483d5e
1754957384
32
16
0x617f3112bf5397d0467d315cc709ef968d9ba546
30000
2
1
0x62b8b11039fcfe5ab0c56e502b1c372a3d2a9c7a
1220000000000000000000
2
2
0x66803fb87abd4aac3cbb3fad7c3aa01f6f3fb207
3771215141154522
1
1
0x765de816845861e75a25fca122bb6898b8b1282a
838892225632138995537
84
63
0x84084b3a9ff2cb1f617355d0773eb37722ba1d49
2000000000000000000
1
1
0xc668583dcbdc9ae6fa3ce46462758188adfdfc24
4040000000000000000
3
2
0xceba9300f2b948710d2653dd7b07f33a8b32118c
1403025332
57
21
0xd8763cba276a3738e6de85b4b3bf5fded6d6ca73
385259595914328588375
44
10
0xe8537a3d056da446677b9e9d6c5db704eaab4787
2000000000000000000
1
1