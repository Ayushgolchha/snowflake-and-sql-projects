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
Copy Paste data into excel file in different sheets
**Excel File Data**
Sheet: **Summary**

Summary Page	
	
Total Amount Spend	2450
Total Order	15006
Total Customers	3


Sheet: **CUSTOMERS**
CUSTOMER_ID	CUSTOMER_NAME	CITY	SIGNUP_DATE
101	Amit	Pune	10-01-2025
102	Neha	Mumbai	15-02-2025
103	Raj	Delhi	01-03-2025


Sheet: **ORDERS**
ORDER_ID	CUSTOMER_ID	ORDER_DATE	AMOUNT
5001	101	05-03-2025	1200
5002	102	06-03-2025	800
5003	101	07-03-2025	450

---

## Input File
Both scripts expect an Excel file in a Snowflake stage:
```text
@EXCEL_FILES_LOAD.EXCEL_FILES.EXCEL_FILES_STAGE/Test/Test_Excel_Load_SF.xlsx
