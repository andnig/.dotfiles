# Working with SQL databases

This repository comes with nvim dadbod, dadbod ui and dadbod ui completion installed.

## Bigquery

To run with Bigquery:

1. Make sure there is a `~/.bigqueryrc` file with the following contents:

    ```conf
    [query]
    use_legacy_sql=false
    ```

2. Add a connection to dadbod as follows:

    ```plain
    bigquery:?project_id=<project_id>
    ```

3. Run `:DBUIToggle` to open the dadbod ui.
