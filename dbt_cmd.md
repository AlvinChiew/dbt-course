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
    - use `--full-refresh` to rebuild incremental table. Use when there is schema change
        - use `--select` to only full refresh a table
            - use `+` before and/or after object to also refresh its backward and/or forward dependencies, e.g. `dbt run --select src_hosts+`

1. `dbt seed`
    - import local files in `seeds` to warehouse

1. `dbt compile`
    - validate if references are correct
    - create query statements from `analyses` into `target/compiled`

1. `dbt source freshness`
    - check freshness based on definition in `source.yml`

1. `dbt snapshot`
    - create and update snapshot defined in `snapshots/` on warehouse as a table.

1. `dbt test`
    - run generic test defined in `schema.yml` and singular tests defined in `tests/`
    - use `--select <test-name>` to only run specific test

1. `dbt deps`
    - install package/dependencies defined in `packages.yml` from [dbt hub](hub.getdbt.com)

1. `dbt docs generate` & `dbt docs serve`
    - generate docs in target (index.html, catalog.json)
    - serve document at [localhost](http://localhost:8080)
    - assets can be browsed via [localhost](http://localhost:8080/assets/)
