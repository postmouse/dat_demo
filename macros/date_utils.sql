{% macro station_of_year(ts) %}
CASE WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (12,1,2) THEN 'WINTER'
     WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (3,4,5) THEN 'SPRING'
      WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (6,7,8) THEN 'SUMMER'
      WHEN MONTH(TO_TIMESTAMP({{ts}})) IN (9,10,11) THEN 'AUTUMN'
END
{% endmacro %}

{% macro DAY_TYPE(ts) %}
CASE WHEN DAYNAME(TO_TIMESTAMP({{ts}})) IN ('Sat','Sun') then 'WEEKEND' else 'BUSINESSDAY' end
{% endmacro %}