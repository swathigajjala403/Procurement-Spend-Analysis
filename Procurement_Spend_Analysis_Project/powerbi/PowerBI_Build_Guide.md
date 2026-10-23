# Power BI Build Guide

## 1. Import data
- Open Power BI Desktop.
- Select **Get data > Text/CSV**.
- Import `data/procurement_transactions.csv`.
- In Power Query, set `Transaction_Date` to Date and `Spend_USD` / `Unit_Price_USD` to Decimal Number.

## 2. Data quality checks
In Power Query:
- Filter blank `Supplier_Name`, `Category`, and `Spend_USD`.
- Keep an original query or duplicate before applying transformations.
- Replace blank categories with `Unclassified` only after documenting the rule.
- Create a normalized supplier field using a small mapping table for obvious variants. Do not merge suppliers based only on similar names without review.

## 3. Suggested DAX measures
```DAX
Total Spend = SUM(procurement_transactions[Spend_USD])

Transaction Count = DISTINCTCOUNT(procurement_transactions[Transaction_ID])

Supplier Count = DISTINCTCOUNT(procurement_transactions[Supplier_Name])

Spend Requiring Review =
CALCULATE(
    COUNTROWS(procurement_transactions),
    FILTER(
        procurement_transactions,
        ISBLANK(procurement_transactions[Supplier_Name]) ||
        ISBLANK(procurement_transactions[Category]) ||
        ISBLANK(procurement_transactions[Spend_USD])
    )
)
```
Note: DAX blank handling and column names may need adjustment based on transformations.

## 4. Build report pages
### Page 1 — Overview
- KPI cards: Total Spend, Transaction Count, Supplier Count, Spend Requiring Review.
- Bar chart: Total Spend by Category.
- Line chart: Total Spend by Month.
- Slicer: Region, Business Unit, and Document Type.

### Page 2 — Supplier Analysis
- Bar chart: Total Spend by normalized supplier.
- Table: Supplier name, transaction count, total spend, share of total spend.
- Highlight supplier-name variants for manual review.

### Page 3 — Data Quality
- Table of missing supplier/category/spend fields.
- Cards showing number of records requiring review.
- Chart showing records by issue type.

## 5. Validation checklist
- Compare total spend to the source CSV after excluding invalid spend values, and explain any difference.
- Check that monthly totals add up to the same overall total under the same filters.
- Confirm supplier normalization does not double-count spend.
- Save the report as `Procurement_Spend_Analysis.pbix` in this folder.
- Take screenshots for a portfolio README if desired.

## Do not overstate results
This dataset is synthetic. Present the work as a practice portfolio project and explain assumptions and limitations.
