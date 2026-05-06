CREATE OR REPLACE PROCEDURE send_weekly_email()
RETURNS STRING
LANGUAGE JAVASCRIPT
AS
$$
var sql_command = `
SELECT ID, TABLE_NAME, LOG_DATE, STATUS, ERROR_MESSAGE, 
PROCESSED_RECORDS
FROM email_integration_log
WHERE log_date >= DATEADD(DAY, -7, CURRENT_DATE)
`;
var stmt = snowflake.createStatement({sqlText: sql_command});
var result = stmt.execute();
var summary_command = `
SELECT
status,
COUNT(*) AS count
FROM email_integration_log
WHERE log_date >= DATEADD(DAY, -7, CURRENT_DATE)
GROUP BY status`;
// Fetch job summary counts first
var summary_stmt = snowflake.createStatement({sqlText: 
summary_command});
var summary_result = summary_stmt.execute();
var email_body = `
<html>
<body>
<h3>Job Summary (Last 7 Days)</h3>
<table border="1" cellpadding="5" cellspacing="0" 
style="border-collapse: collapse; width: 50%;">
<tr style="background-color: #f2f2f2;">
<th>Status</th>
<th>Count</th>
</tr>`;
while (summary_result.next()) {
email_body += `
<tr>
<td>${summary_result.getColumnValue(1)}</td>
<td>${summary_result.getColumnValue(2)}</td>
</tr>`;
}
email_body += `
</table>
<br>
<h3>Weekly Email Integration Log</h3>
<table border="1" cellpadding="5" cellspacing="0" 
style="border-collapse: collapse; width: 100%;">
<tr style="background-color: #f2f2f2;">
<th>Log ID</th>
<th>Log Date</th>
<th>Status</th>
<th>Message</th>
</tr>`;
// Fetch detailed logs
var stmt = snowflake.createStatement({sqlText: sql_command});
var result = stmt.execute();
while (result.next()) {
email_body += `
<tr>
<td>${result.getColumnValue(1)}</td>
<td>${result.getColumnValue(2)}</td>
<td>${result.getColumnValue(3)}</td>
<td>${result.getColumnValue(4)}</td>
</tr>`;
}
email_body += `
</table>
</body>
</html>`;
var email_command = `
CALL SYSTEM$SEND_EMAIL(
'EMAIL_NOTIFICATION_INTEGRATION',
'Youremail',
'Weekly Email Log Report',
'${email_body}',
'TEXT/HTML'
)`;
var email_stmt = snowflake.createStatement({sqlText: 
email_command});
email_stmt.execute();
return "Email of scheduled job sent successfully!";
$$;
