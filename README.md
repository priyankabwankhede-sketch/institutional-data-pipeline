## Institutional Data Validation & Reporting Pipeline

# Tech Stack: Python, R, CSV, GitHub

This project demonstrates automated processing, validation, and reporting of institutional-style data (e.g., enrollment, courses, departments, terms). Python is used for data ingestion and cleaning, while R is used to generate analytical summaries and visualizations.

# Repository Structure:
* data/

  * raw/

    * enrollment_raw.csv
    * courses.csv
    * departments.csv
  * processed/

    * enrollment_processed.csv
* python/

  * ingest_validate.py
  * data_quality_checks.py
* r/

  * reporting_analysis.R
* outputs/

  * total_credits_department.png
  * enrollment_credit_distribution.png
  * enrollment_by_discipline.png
  * avg_credit_score_by_discipline.png
* README.txt
* requirements.txt


# Features:

Python (Automation + Validation)
- Reads raw CSV files from data/raw/
- Performs:
  - Null checks
  - Duplicate detection
  - Range checks on credits and enrollment counts
- Cleans data and outputs processed CSV to data/processed/enrollment_processed.csv

# R (Reporting + Visualizations)
- Reads processed CSV from data/processed/
- Generates charts and saves PNG files in outputs/:
  1. Total Credits per Department
  2. Enrollment Distribution by Credit Classification (1–6 scale)
  3. Enrollment Distribution by Discipline (CS vs DS)
  4. Average Credit Score by Discipline

# How to Run:

# Python:
1. Install dependencies: pip install pandas pyyaml
2. Run ingestion and validation: python python/ingest_validate.py

# R:
1. Install dependencies if not installed: install.packages(c("dplyr", "ggplot2", "stringr"))
2. Run reporting script: source("r/reporting_analysis.R")

All charts are automatically saved to the outputs/ folder.

# Usage:

This project simulates real institutional analytics workflows and can be adapted for:
- University enrollment analysis
- Department performance reports
- Credit distribution studies
- Automated institutional data quality checks
