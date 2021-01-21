#standardSQL

{{ config(materialized="view") }}

SELECT
date,
SUM(totals.visits) AS visits,
SUM(totals.pageviews) AS pageviews,
SUM(totals.transactions) AS transactions,
SUM(totals.transactionRevenue)/1000000 AS revenue
FROM `vocal-tracker-302409.dbt_test.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN FORMAT_DATE('%Y%m%d',DATE_SUB(DATE(2017, 06, 18), INTERVAL 3 DAY))
AND
FORMAT_DATE('%Y%m%d',DATE_SUB(DATE(2017, 06, 18), INTERVAL 1 DAY))
GROUP BY date
ORDER BY date ASC
