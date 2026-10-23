# Project Summary

## Project
Procurement Spend Analysis Dashboard

## Objective
Create visibility into procurement spending and identify data-quality issues using synthetic transaction data.

## Questions to answer
1. What is the total spend by category?
2. Which normalized suppliers account for the largest share of spend?
3. How does spend change month by month?
4. Which business units and regions generate the most spend?
5. Which records have missing supplier, category, or spend values?
6. Which supplier names may refer to the same supplier?

## Analysis workflow
1. Inspect raw transactions.
2. Check missing values and invalid/non-positive spend.
3. Normalize obvious supplier-name variants using a documented mapping.
4. Summarize spend by category, supplier, month, business unit, and region.
5. Build dashboard visuals.
6. Document limitations and recommendations.

## Interview talking points (after you do the work)
- Explain why raw data is preserved separately from cleaned data.
- Explain how supplier normalization can prevent fragmented supplier reporting.
- Explain why missing categories should be marked as unclassified rather than silently guessed.
- Explain how you validated totals between the source data and dashboard.
- Mention that the dataset is synthetic and the results are illustrative.

## Resume bullet template — use only after completing and validating the project
- Analyzed a synthetic procurement dataset in Excel and Power BI to summarize spend by supplier, category, and month.
- Applied data-quality checks to flag missing fields and reviewed supplier-name variants for normalization.
- Built KPI cards and charts to communicate spend trends and data-quality findings.

Do not claim cost savings were achieved unless you calculate and clearly label an estimated opportunity using an explicit assumption.
