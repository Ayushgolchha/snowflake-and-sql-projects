Excel → Snowflake (All Sheets)

### Excel → Snowflake (All Sheets)
- Reads an Excel file stored in a **Snowflake stage**
- Loads every worksheet into a Snowflake table (one table per sheet)
- Uses `modin.pandas` + `snowflake.snowpark.modin.plugin` for fast ingestion
