# AML Transaction Monitoring Project (SQL + Python)

## Overview

This is an educational project designed to simulate a simplified real-world workflow of a Financial Crime Compliance Analyst or Junior AML/KYC Specialist. It focuses on detecting suspicious transactions using client data, transaction logs, and country risk information.

The project is implemented in both:
- **SQL** — for querying and flagging suspicious activity from a database.
- **Python (Pandas)** — for data processing and automation of compliance checks.

---

## Project Structure

| File                     | Purpose |
|--------------------------|---------|
| `clients.csv`            | List of clients with flags for PEP and sanctions |
| `transactions.csv`       | Simulated client transactions |
| `countries_risk.csv`     | Risk levels of countries (High/Low) |
| `query.sql`              | SQL query to detect suspicious transactions |
| `monitoring_script.py`   | Python script that performs the same checks using pandas |
| `flagged_transactions.csv` | [Generated] Exported suspicious transactions |
| `sample_sar_report.txt`  | Example of a basic SAR (Suspicious Activity Report) |

---

## Suspicious Activity Detection Rules

A transaction is flagged as suspicious if **any** of the following conditions are met:
- The client is a Politically Exposed Person (PEP)
- The client is on a sanctions list
- The destination country is high-risk
- The transaction amount exceeds $40,000

---
