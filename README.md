**Medical Inventory Optimization**

Medical Inventory Optimization is a healthcare analytics project designed to improve medicine availability, reduce patient bounce rates, analyze pharmaceutical sales and returns, and support better inventory decisions. The project uses Python, SQL, Excel, and Power BI to analyze real medical billing and drug-transaction data.

Project Overview

Healthcare organizations must maintain enough medicine stock to meet patient demand while avoiding excess inventory, expiry losses, and unnecessary storage costs. Poor inventory planning can result in unavailable medicines, delayed service, and patients leaving without completing a purchase.

This project analyzes medical inventory, departmental sales, billing dates, medicine demand, returned quantities, and patient-related transaction records to identify inventory issues and provide data-driven recommendations.

Industry: Healthcare and hospitals
Department: Inventory management
Project type: Data analytics and business intelligence

**Business Objectives**

Monitor medicine stock levels and identify low-stock items.

Reduce the patient bounce rate caused by medicine unavailability.

Determine suitable reorder points using demand and stock information.

Identify slow-moving, fast-moving, and excess-stock medicines.

Support future supplier-performance and delivery-reliability analysis when supplier data becomes available.

Minimize inventory and expiry-related costs.

Support the business targets of reducing bounce rate by at least 30% and increasing revenue by ₹20 lakh.

The percentages and revenue figures above are business targets defined for the project, not claimed production results.

**Tools and Technologies**

Tool

Purpose

Python

Data cleaning, preprocessing, exploratory data analysis, and calculations

Pandas

Excel import, data manipulation, profiling, and statistical analysis

Matplotlib and Seaborn

Exploratory data visualization

SQL

Data extraction, validation, aggregation, and analysis

Microsoft Excel

Data validation and summary verification

Power BI

Interactive dashboard development and KPI reporting

Dataset Overview

The cleaned Excel workbook contains 14,192 transaction records across 14 columns:

Column

**Description**

Typeofsales

Sale transaction type

Patient_ID

Patient identifier associated with the transaction

Specialisation

Medical specialization

Dept

Hospital department

Dateofbill

Billing date

Quantity

Quantity sold

ReturnQuantity

Quantity returned

Final_Cost

Final transaction cost

Final_Sales

Final sales value

RtnMRP

Returned-product value

Formulation

Medicine formulation

DrugName

Medicine name

SubCat

Product subcategory

SubCat1

Additional product classification

**Project Files**

Cleaned_Medical_Inventory_Data (1).xlsx

Cleaned medical transaction dataset

medical_inventory_analysis_script.py.py

Python script for data profiling, departmental sales, and monthly trends

Medical_Inventory_SQL_Preprocessing.sql

SQL preprocessing, bounce analysis, returns, and sales queries

medical inventory.pibx.pbix

Interactive Power BI dashboard

Medical_Inventory_PowerBI_Theme.json

Custom dashboard theme

report.pibx.png

Dashboard screenshot

EDA.docx

Exploratory analysis and visualization documentation

Project_Charter_Document-Template-2023v2 (1).docx

Project charter, scope, and business objectives

Untitled Diagram.drawio.pdf

Project architecture or workflow diagram

DA Final Presentation Templete.pptx

Final project presentation

Powerbi presentation.mp4

Dashboard presentation recording

Project Workflow

Data collection – Gathered medical billing, sales, department, medicine, and return records.

Data cleaning – Handled missing values, duplicate records, inconsistent formats, and invalid quantities using Python.

Data validation – Used SQL and Excel to verify cleaned records and calculated summaries.

Exploratory data analysis – Studied sales movement, demand patterns, department performance, and medicine returns.

KPI calculation – Evaluated key measures such as sales value, returned quantities, net sales, and bounce indicators.

Dashboard development – Created a Power BI dashboard with KPI cards, charts, tables, filters, and slicers.

Business recommendations – Identified medicines requiring reorder action and areas where inventory planning could be improved.

**Key Performance Indicators**
Total sales and department-wise sales

Monthly sales trends

Quantity sold and returned quantity

Net quantity and net sales

Bounce cases identified from zero final sales

Most frequently returned medicines

Medicine-wise demand patterns

Inventory-related cost and sales value

Stock balances, expiry dates, reorder thresholds, and supplier lead times require additional source data and should be treated as future analysis opportunities when those fields are unavailable.

**Analysis Performed**

Compared medicine quantities, sales values, and return patterns.

Identified medicines requiring closer inventory monitoring.

Classified medicines based on their movement and usage patterns.

Examined demand trends to support inventory planning.

Identified opportunities to add supplier-performance analysis when supplier records are available.

Investigated inventory inconsistencies and validated quantities.

Prepared reorder suggestions for medicines requiring attention.

Dashboard Features

The Power BI dashboard provides:

KPI cards for important inventory measures.

Stock-level and demand trend charts.

Medicine-wise inventory status.

Sales, return, and bounce-related performance indicators.

Department-wise and medicine-wise performance comparison.

Filters and slicers for department, medicine, category, and date.

Drill-down views for detailed analysis.

Project Structure

**360 DIGI TMG PROJECT/**
├── Cleaned_Medical_Inventory_Data (1).xlsx
├── medical_inventory_analysis_script.py.py
├── Medical_Inventory_SQL_Preprocessing.sql
├── medical inventory.pibx.pbix
├── Medical_Inventory_PowerBI_Theme.json
├── report.pibx.png
├── EDA.docx
├── Project_Charter_Document-Template-2023v2 (1).docx
├── Untitled Diagram.drawio.pdf
├── DA Final Presentation Templete.pptx
├── Powerbi presentation.mp4
└── README.md



**Python Analysis**

The Python script:

Loads the cleaned Excel dataset using Pandas.

Builds a data dictionary covering column names, data types, non-null counts, missing values, and unique values.

Exports the data dictionary as Data_Dictionary_Output.xlsx.

Generates descriptive statistics.

Visualizes total sales by department.

Extracts monthly periods from billing dates.

Plots monthly sales trends using Matplotlib and Seaborn.

Important Column-Name Mapping

The supplied Python script expects Department, Total_Amount, and Bill_Date, but the Excel file contains Dept, Final_Sales, and Dateofbill. Add this mapping immediately after loading the workbook:

df = pd.read_excel("Cleaned_Medical_Inventory_Data (1).xlsx")

df = df.rename(
    columns={
        "Dept": "Department",
        "Final_Sales": "Total_Amount",
        "Dateofbill": "Bill_Date",
    }
)

**SQL Analysis**

The SQL script includes:

Duplicate identification and cleanup.

Missing-value handling for quantities and departments.

Billing month and year extraction.

Bounce flag creation for transactions with zero final sales.

Net quantity calculation: Quantity - ReturnQuantity.

Net sales calculation: Final_Sales - RtnMRP.

Department-wise bounce analysis.

Identification of frequently returned medicines.

Monthly sales trend analysis.

Adapt the SQL to your database engine before execution. The workbook uses DrugName, while the SQL file refers to Drug_Name; duplicate-removal and date-extraction syntax may also require adjustment.

**How to Run the Project
1. Clone the repository

git clone <https://github.com/sathwikreddy19/Medical-Inventory-Optimization/edit/main/README.md>
cd <C:\Users\pvrvi\Downloads\360 DIGI TMG PROJECT>

2. Create and activate a virtual environment

python -m venv venv

On Windows:

venv\Scripts\activate

On macOS or Linux:

source venv/bin/activate

3. Install the required libraries

pip install pandas matplotlib seaborn openpyxl

4. Run the analysis

Keep the Python file and Excel workbook in the same folder, apply the column-name mapping described above, and run:

python medical_inventory_analysis_script.py.py

5. View the dashboard

Open medical inventory.pibx.pbix using Microsoft Power BI Desktop and refresh the data connection if prompted.

6. Run the SQL analysis

Import the dataset into a table named medical_inventory, adjust the SQL syntax and column names for your database, and execute Medical_Inventory_SQL_Preprocessing.sql.


**Key Insights**

The analysis is intended to help stakeholders:

Detect low-stock medicines before they become unavailable.

Prioritize frequently used medicines during procurement.

Avoid unnecessary purchases of slow-moving items.

Improve reorder planning using demand and usage patterns.

Identify departments and medicines that require closer operational review.

Make inventory decisions through a single interactive dashboard.

Recommendations

Define medicine-specific reorder points instead of using one common threshold.

Review fast-moving and critical medicines more frequently.

Create automated alerts for low-stock and near-expiry items.

Use historical demand patterns when planning purchases.

Track supplier lead time and fulfillment rate regularly.

Apply FEFO (First Expired, First Out) for medicines with expiry dates.

**Future Enhancements**

Add machine-learning-based demand forecasting.

Build real-time stock and reorder notifications.

Integrate the dashboard with a live inventory database.

Add batch-level expiry tracking.

Develop a web application for inventory monitoring.

Automate scheduled dashboard refreshes and reports.

Data Privacy

The dataset includes a Patient_ID column. Publish only anonymized, synthetic, or explicitly authorized data. Do not upload patient-identifiable information, NDA forms, personal certificates, private supplier details, database credentials, or confidential project documents without permission.

Author
Sathwik Reddy Chepyala
360 Digi Img


