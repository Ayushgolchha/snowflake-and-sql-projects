# Snowflake Excel Loader + Column Lineage Generator (Snowpark Python)

## Overview
This repository contains two Snowpark Python scripts that automate Excel ingestion into Snowflake and optionally generate basic **column lineage** from Excel Summary formulas.



### Script : Excel → Snowflake + Summary Lineage
- Reads the same Excel file from a Snowflake stage (binary read)
- Loads non-summary worksheets into Snowflake tables
- Finds formulas in Summary sheets (example: column `B`)
- Extracts referenced sheet/range from formulas (ex: `Sheet1!A:C`)
- Creates a **lineage table** showing which columns from which sheets are used by Summary

---

## What This Project Does (High Level)
✅ Loads Excel worksheets into Snowflake tables automatically  
✅ Creates one table per sheet in target database/schema  
✅ Parses formulas in summary sheets to understand dependencies  
✅ Produces a lineage output table such as:

| PARENT_TABLE | REFERENCE_TABLE | COLUMNS_USE |
|------------|------------------|------------|
| SUMMARY     | CUSTOMER_DATA    | CUSTOMER_ID |
| SUMMARY     | ORDER_DETAILS    | ORDER_DATE  |

---

## Prerequisites
- Snowflake account with Snowpark Python enabled
- Excel file uploaded to a Snowflake stage (example used in scripts)
- Required Python libraries available in Snowflake:
  - `modin.pandas`
  - `snowflake.snowpark.modin.plugin`
  - `openpyxl`

---

## Input File
Both scripts expect an Excel file in a Snowflake stage:
```text
@EXCEL_FILES_LOAD.EXCEL_FILES.EXCEL_FILES_STAGE/Test/Test_Excel_Load_SF.xlsx
