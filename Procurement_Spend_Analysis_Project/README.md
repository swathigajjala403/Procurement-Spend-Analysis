# Procurement Spend Analysis Dashboard (Portfolio Project)

## Purpose
Analyze procurement transactions to understand spend by supplier, category, business unit, region, and month. Practice data quality checks and supplier normalization.

## Dataset notice
This project uses **synthetic sample data generated for practice**. It is not real Zycus/customer/company data and must not be described as production or client work.

## Files
- `data/procurement_transactions.csv` — 600 synthetic transactions, including a small number of intentional missing values for data-quality practice.
- `Procurement_Spend_Analysis.xlsx` — workbook with Raw_Data, Clean_Data, Dashboard, Supplier_Review, Category_Summary, and Monthly_Summary sheets.
- `sql/spend_analysis_queries.sql` — example SQL queries.
- `powerbi/PowerBI_Build_Guide.md` — steps to build a Power BI report from the CSV.
- `PROJECT_SUMMARY.md` — project overview and interview talking points.

## How to use the Excel workbook
1. Open `Procurement_Spend_Analysis.xlsx` in Microsoft Excel and enable calculation if prompted.
2. Start with `Dashboard`.
3. Review `Raw_Data` for original source values and `Clean_Data` for cleaning flags and illustrative supplier normalization.
4. Review `Supplier_Review`, `Category_Summary`, and `Monthly_Summary`.
5. Inspect flagged rows; do not assume all data has been cleaned automatically. Validate normalization rules before presenting findings.

## Suggested Power BI visuals
- KPI cards: Total Spend, Transaction Count, Distinct Suppliers, Records Requiring Review.
- Bar chart: Spend by Category.
- Bar chart: Spend by Normalized Supplier.
- Line chart: Monthly Spend.
- Matrix: Business Unit by Category with Spend.
- Table: Data-quality issues requiring review.

## Important
The Excel workbook is a learning template. Formula behavior may vary by spreadsheet app. Review formulas and validate totals after opening. Do not claim that this project is complete until you have opened the workbook, checked results, and built/validated your Power BI report if you list Power BI as a tool used for this project.
