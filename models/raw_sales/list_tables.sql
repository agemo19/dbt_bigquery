{{ config(materialized='table') }}

SELECT table_name
FROM testbigquery-395104.raw_bq.INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE'