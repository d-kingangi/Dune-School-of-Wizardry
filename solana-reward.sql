--query to find reward paid out on solana

select 
    block_date,
    reward_type,
    (sum(lamports) / 1000) as sol
from solana.rewards
where 1=1
    and block_date > current_date - interval '720' day
    and reward_type = 'Fee'
group by 1,2
order by 1 desc

--query execution timed out after 2 minutes 