--creating task(schedule at At 23:00 on Sunday)
CREATE OR REPLACE TASK weekly_email_task
WAREHOUSE = COMPUTE_WH
SCHEDULE = 'USING CRON 0 23 * * 0 UTC'
AS
CALL send_weekly_email();
