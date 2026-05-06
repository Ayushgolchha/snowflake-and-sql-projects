# Snowflake Weekly Email Notification – Integration Log Report

## Overview
This project demonstrates how to build an automated weekly email reporting workflow in **Snowflake** using:
- A **log table** to store integration/job execution results
- A **stored procedure** to generate an HTML report (summary + detailed logs)
- A **Snowflake Email Notification Integration**
- A **scheduled task** (cron) to run weekly and send the email

The result is a production-style monitoring/reporting setup where stakeholders receive a weekly email containing job status counts and error details.

---

## Features
✅ Create a centralized log table for tracking status and errors  
✅ Insert sample **Success** and **Failure** log entries for testing  
✅ Generate a weekly HTML report for the last 7 days  
✅ Send emails using `SYSTEM$SEND_EMAIL` via Email Notification Integration  
✅ Automate execution with a weekly scheduled Snowflake Task (Sunday 23:00 UTC)

---

## Tech Stack
- **Snowflake SQL**
- **Snowflake Tasks (CRON Scheduling)**
- **JavaScript Stored Procedure**
- **Notification Integration (EMAIL)**
- **SYSTEM$SEND_EMAIL**

---

## Project Structure (Recommended)

---

## Setup & Execution

### 1) Create Log Table
1)Creates a table to store job results, status, error messages and processing counts.
2)Two scripts insert sample log entries:
- **Success logs**
- **Failure logs with error messages**
**File:** `01_create_log_table.sql`


---

### 2) Create Email Notification Integration
This object enables Snowflake to send emails using a pre-approved recipient list.

**File:** `02_create_email_notification_integration.sql`

Example (replace with your email):


---

### 3) Create Stored Procedure (Weekly Email Generator)
The stored procedure:

Fetches last 7 days logs
Creates a summary (Success vs Failure)
Builds an HTML table email body
Sends email via SYSTEM$SEND_EMAIL

**File:** `03_create_stored_procedure_send_weekly_email.sql`

---

**4) Create Weekly Task**
A task is scheduled using CRON to run the procedure every Sunday at 23:00 UTC.

**File:**`04_create_weekly_task.sql`

---

**Output** **(What Email Contains)**
The email includes:
1) Job Summary (Last 7 Days)

**Status (Success / Failure)
Count**

2) Detailed Log Table

**Log ID
Log Date
Status
Error Message (if any)**

---
