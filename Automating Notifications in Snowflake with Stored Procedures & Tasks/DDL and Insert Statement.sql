--Creating a log table
CREATE TABLE email_integration_log (
id INT AUTOINCREMENT PRIMARY KEY,  -- Unique identifier for each 
log entry
table_name STRING NOT NULL,
email integration
        --
 Name of the table involved in 
log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date and time of 
the log entry
status STRING , -- Status of the email integration
error_message STRING,      
         -- Stores error details in case 
of failure
processed_records INT,     
         -- Number of records processed
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of 
record creation
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of last 
update
);-- Insert Statement(success) for log table
INSERT INTO email_integration_log (table_name, log_date, status, 
processed_records)
SELECT
'customer_data', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 500 UNION ALL
SELECT
'order_details', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 1200 UNION ALL
SELECT
'product_catalog', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 800 UNION ALL
SELECT
'invoice_records', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 450 UNION ALL
SELECT
'shipment_tracking', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 700 UNION ALL
SELECT
'employee_details', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 350 UNION ALL
SELECT
'supplier_data', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 600 UNION ALL
SELECT
'sales_summary', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 900 UNION ALL
SELECT
'customer_feedback', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 300 UNION ALL
SELECT
'marketing_campaigns', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Success', 750;-- Insert Statement(Failure) for log table
INSERT INTO email_integration_log (table_name, log_date, status, 
error_message, processed_records)
SELECT
'customer_data', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'SMTP connection timeout', 0 UNION ALL
SELECT
'order_details', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Invalid email address format', 0 UNION 
ALL
SELECT
'product_catalog', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Email server not responding', 0 UNION 
ALL
SELECT
'invoice_records', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Database connection lost', 0 UNION ALL
SELECT
'shipment_tracking', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Attachment size too large', 0 UNION 
ALL
SELECT
'employee_details', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Unauthorized access error', 0 UNION 
ALL
SELECT
'supplier_data', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Missing required fields', 0 UNION ALL
SELECT
'sales_summary', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Email quota exceeded', 0 UNION ALL
SELECT
'customer_feedback', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'API authentication failed', 0 UNION 
ALL
SELECT
'marketing_campaigns', DATEADD(DAY, UNIFORM(1, 100, RANDOM()), 
CURRENT_DATE - 100), 'Failure', 'Duplicate email addresses detected', 
0;
