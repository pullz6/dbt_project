{{ config(materialized='view') }} 

with base as (
    select *
        ,row_number() over (partition by user_id, event_id order by placed_at_lnd desc) as rn
from {{ ref('bets_transformed') }}
) 

select *
from base
where rn = 1
