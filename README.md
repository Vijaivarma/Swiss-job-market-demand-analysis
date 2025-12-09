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

## SQL Analysis (Day 3)

- Loaded the cleaned dataset into **MySQL** using a simple loader script (`scripts/load_to_mysql.py`).
- Created a `jobs` table to store the final Swiss job snapshot.
- Wrote analysis queries to explore:
  - Jobs per canton, city, and company
  - Demand by role category (Data Analyst, Data Engineer, Business / BI Analyst)
  - Remote vs onsite vs hybrid work models
  - Seniority mix across cantons and hiring companies
- Saved all queries in: **`scripts/sql_analysis.sql`** so they can be reviewed and re-run.

## Interactive Dashboard (Day 3 Output – Power BI)

Built a 3-page **Swiss Job Market Dashboard** in Power BI using the cleaned dataset:

- **Page 1 – Swiss Job Market Overview (2025)**
  - KPI cards: Total Jobs, Unique Companies, % Remote, % Senior Roles
  - Top 10 cities by job postings
  - Top 10 vs Others share of all jobs
  - Role popularity breakdown (Data Analyst vs Data Engineer vs Business Analyst vs Other roles)
  - Top 5 hiring companies with % senior roles
  - Work model split (onsite vs remote vs hybrid)
  - Job seniority breakdown (Entry / Intern, Mid-level, Senior)

- **Page 2 – Swiss Map Drilldown**
  - Full-screen Swiss map with bubbles sized by job count
  - Floating card showing work model split, seniority mix, and top hiring companies for the selected canton
  - Clicking a canton filters both the map and the insight card

- **Page 3 – Swiss Job Insights (2025)**
  - Key hiring ratios: hiring concentration, senior remote gap, Zurich job share
  - Seniority structure across cantons (heatmap)
  - Role distribution across Switzerland (Data Analyst / Engineer / Business Analyst)
  - Remote vs onsite preferences for top hiring companies
  - An “Insight Narrative” panel summarising the main findings in plain English

## How to Run the Project

1. **Clone the repository**

git clone https://github.com/Vijaivarma/Swiss-job-market-demand-analysis.git

cd Swiss-job-market-demand-analysis

## Key Insights from this Snapshot

- Job demand is concentrated in **Zurich, Bern and Geneva**, with a long tail of smaller cities.
- **Data Analyst** is the most common role in this dataset, followed by Business Analyst and Data Engineer.
- Most roles are **mid-level**, with a smaller but visible share of senior positions.
- **Remote-only roles remain limited**; onsite and hybrid roles dominate across most regions.
- A relatively small group of companies account for a large share of postings, which is typical of a concentrated job market.

> This is a snapshot dataset scraped from Indeed.ch for portfolio purposes.  
> It is not a complete representation of the entire Swiss job market.
