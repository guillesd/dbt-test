
with dbt__CTE__INTERNAL_test as (
#standardSQL

select revenue 
from `vocal-tracker-302409`.`dbt_test`.`daily_report`
where revenue < 0
)select count(*) from dbt__CTE__INTERNAL_test