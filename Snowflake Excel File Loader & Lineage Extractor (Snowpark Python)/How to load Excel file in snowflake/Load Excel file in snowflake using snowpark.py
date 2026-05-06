#########LOAD EXCEL FILE INTO SNOWFLAKE

import modin.pandas as pd
import snowflake.snowpark.modin.plugin

def main(session):
    file_path = "@EXCEL_FILES_LOAD.EXCEL_FILES.EXCEL_FILES_STAGE/Test/Test_Excel_Load_SF.xlsx"

    # Read all worksheets
    all_sheets = pd.read_excel(
        file_path,
        sheet_name=None
    )
    print("all_sheets")
    print("Sheet names found:")
    print(list(all_sheets.keys()))

    # Preview each sheet
    for sheet_name, df in all_sheets.items():
        print(f"\n===== Sheet: {sheet_name} =====")
        print(df.head())
        full_table_name = f"EXCEL_FILES_LOAD.EXCEL_FILES.{sheet_name}"
        print(full_table_name)
        snowpark_df = pd.to_snowpark(df, index=False)
        
        snowpark_df.write.save_as_table(
            full_table_name,
            mode="overwrite"
        )


    return "Successfully read all sheets"
    
    
