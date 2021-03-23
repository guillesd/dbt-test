#standardSQL

{{ config(
    materialized='table') }}

SELECT
    date,
    SUM(totals.visits) AS visits,
    SUM(totals.pageviews) AS pageviews,
    SUM(totals.transactions) AS transactions,
    SUM(totals.transactionRevenue)/1000000 AS revenue
FROM {{ source('dbt_test', 'ga_sessions') }}
WHERE
    _TABLE_SUFFIX BETWEEN '20170701' AND '20170726'
GROUP BY date
ORDER BY date ASC
