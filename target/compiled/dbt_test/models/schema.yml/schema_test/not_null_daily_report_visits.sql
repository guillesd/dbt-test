
    
    



select count(*) as validation_errors
from `vocal-tracker-302409`.`dbt_test`.`daily_report`
where visits is null


