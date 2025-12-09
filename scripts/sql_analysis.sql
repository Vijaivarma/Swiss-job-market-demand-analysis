/* Swiss Job Market Demand Analysis – SQL Insights
   Author: Vijai varma
   Date: September 2025
   ------------------------------------------------------------
   This script contains SQL queries to explore the Swiss job
   market from multiple angles: cities, companies, remote work,
   seniority levels, and high-demand roles. */

/* Top 10 Cities by Job Count */
SELECT city, COUNT(*) AS job_count
FROM jobs
GROUP BY city
ORDER BY job_count DESC
LIMIT 10;

/* Most Hiring Companies in Each Canton */
SELECT canton, company_clean, COUNT(*) AS job_count
FROM jobs
GROUP BY canton, company_clean
ORDER BY canton, job_count DESC;

/* Remote Work Share by Canton (percentage) */
SELECT canton,
       ROUND(
         SUM(CASE WHEN remote_type = 'Remote' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
         2
       ) AS remote_percentage
FROM jobs
GROUP BY canton
ORDER BY remote_percentage DESC;

/* Seniority Breakdown by City */
SELECT city, seniority_level, COUNT(*) AS job_count
FROM jobs
GROUP BY city, seniority_level
ORDER BY city, job_count DESC;

/* Top Job Titles for Remote Roles */
SELECT title_en, COUNT(*) AS job_count
FROM jobs
WHERE remote_type = 'Remote'
GROUP BY title_en
ORDER BY job_count DESC
LIMIT 10;

/* Top Companies Hiring for Senior Roles */
SELECT company_clean, COUNT(*) AS senior_roles
FROM jobs
WHERE seniority_level = 'Senior'
GROUP BY company_clean
ORDER BY senior_roles DESC
LIMIT 10;

/* Jobs per Canton with % Share */
SELECT canton,
       COUNT(*) AS job_count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM jobs), 2) AS percentage_share
FROM jobs
GROUP BY canton
ORDER BY job_count DESC;

/* Remote Share by Seniority Level */
SELECT seniority_level,
       ROUND(
         SUM(CASE WHEN remote_type = 'Remote' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
         2
       ) AS remote_share
FROM jobs
GROUP BY seniority_level
ORDER BY remote_share DESC;

/* High-Demand Roles (more than 5 postings) */
SELECT title_en, COUNT(*) AS demand
FROM jobs
GROUP BY title_en
HAVING COUNT(*) > 5
ORDER BY demand DESC;
