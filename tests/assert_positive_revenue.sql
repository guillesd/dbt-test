#standardSQL

select revenue 
from {{ ref('daily_report') }}
where revenue < 0