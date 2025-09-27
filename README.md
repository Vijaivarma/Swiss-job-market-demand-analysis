# Swiss Job Market Demand Analysis

This project analyzes job demand in Switzerland across roles such as **Data Analyst, Data Engineer, and Business Analyst**.  
It is designed as a **recruiter-facing portfolio project** to demonstrate end-to-end data skills: scraping, cleaning, SQL, visualization, and reporting.

## Project Overview
- **Data Source:** Jobs scraped from Indeed.ch  
- **Goal:** Identify job demand trends across Swiss cities, cantons, and remote opportunities  
- **Stack:** Python, Pandas, SQL, Power BI, GitHub  

## Data Cleaning (Day 1 Output)
- Removed duplicate job postings (based on `job_id`)  
- Dropped unused fields (`link`, `date_posted`)  
- Fixed encoding issues (e.g., `ZÃ¼rich` → `Zürich`)  
- Translated job titles into English for consistency  
- Standardized company names and job titles  
- Split `location` into structured fields: `city`, `canton`, `remote_type`  
- Added flags for remote jobs and extracted seniority levels  
- Added a fixed `scrape_date` (2025-09-25) to mark dataset snapshot  
- Final cleaned dataset saved as: **`data/Swiss-jobs-cleaned-final.csv`**

## Exploratory Data Analysis (Day 2)
- Performed job market overview (companies, cities, job titles)  
- Visualized top hiring cities, companies, and roles in demand  
- Compared remote vs onsite vs hybrid work across cantons  
- Analyzed seniority levels and city–seniority breakdowns  
- Exported recruiter-ready visuals → `/visuals/`  
- *Personal reflection included at the end of the notebook* 
