# Setup

1. `dbt init <proj-name (dbtlearn)>`
    - snowflake
    - DI70466.ap-southeast-1
    - dbt (username)
    - password
    - \<pwd\>
    - transform (user role)
    - COMPUTE_WH (warehouse)
    - airbnb (db)
    - dev (schema)
    - 4 (threads  for parallel execution)

1. `cat ~/.dbt/profiles.yml`
    - view profile 

1. `dbt debug`
    - check profile & connection

1. `dbt run`
    - validate & commit changes, execute incremental load
    - use `--ful-refresh` to rebuild incremental table. Use when there is schema change

1. `dbt seed`
    - import local files in `seeds` to warehouse

1. `dbt compile`
    - validate if references are correct

1. `dbt source freshness`
    - check freshness based on definition in `source.yml`