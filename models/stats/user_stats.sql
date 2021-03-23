#standardSQL

{{ config(
    materialized='table') }}

SELECT date, visitorId, 
    sum(totals.visits) as user_visits,
    sum(totals.pageviews) as user_pageviews
FROM {{ source('dbt_test', 'ga_sessions') }}
WHERE 
    _TABLE_SUFFIX BETWEEN '20170701' AND '20170726'
GROUP BY 1,2