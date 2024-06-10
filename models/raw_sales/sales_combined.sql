-- models/combined_table.sql

{{ config(materialized='table') }}

{% set table_list_table = ref('list_tables') %}
{% set combined_query = combine_tables(table_list_table) %}

{{ combined_query }}
