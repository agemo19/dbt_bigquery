-- macros/combine_tables.sql

{% macro combine_tables(table_list_table_ref) %}
  {% set query = "SELECT table_name FROM " ~ table_list_table_ref %}
  {% set table_names = run_query(query) %}
   
  {# Log the results for debugging #}
  {{ log("loginu" ~ table_names, info=True) }}

  {% set sql_statements = [] %}
  
  {% for table in table_names %}
    {% set table_name = table.table_name %}
    {% set sql_statement = "SELECT * FROM testbigquery-395104.raw_bq." ~ table_name %}
    {% do sql_statements.append(sql_statement) %}
  {% endfor %}

  {% set union_query = sql_statements | join(" UNION ALL ") %}

  {{ union_query }}

{% endmacro %}
