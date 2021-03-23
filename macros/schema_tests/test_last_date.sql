{% macro test_last_date(model, column_name) %}

    {% set yesterday = modules.datetime.date.today() - modules.datetime.timedelta(days=1) %}
    {% set yesterday_string = yesterday.strftime("%Y%m%d") %}

    WITH check AS(
        SELECT count(*) as date_is_there
        FROM {{model}}
        WHERE {{column_name}} = '{{yesterday_string}}'
    )
    SELECT CASE 
        WHEN date_is_there > 0 THEN 0
        ELSE 1 
        END AS result
    FROM check

{% endmacro %}