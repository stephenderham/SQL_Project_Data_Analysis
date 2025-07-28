# Introduction
This project focuses on the analyse and the interaction of a data job market database via SQL. Focusing on analyst roles, it explores the top-paying jobs, in-demnd skills, and where high demand meets high salary in analytical roles.

SQL queries to explore this database? Check them out here: [project_1_sql folder](/project_1_sql/)
# Background
This project was influenced by the importance of understanding the data job market and identifying the key skills most in demand. It provided valuable insight into which tools and technologies are essential for data professionals, helping me make more informed decisions about what to learn and where to focus my upskilling efforts. At the same time, it gave me practical, hands-on experience with SQL queries and working directly with a large, real-world dataset of job postings. 

### The questions/queries used to gain insight:
1. What are the top-paying analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools Used
To deep dive into this job market database, the tools utilized to gain these insights were:
- **SQL**: The main analytical tool for my analyse, allowing me to query the database and discover critical insights
- **PostgreSQL**: The chosen database management system to handle the job postings data
- **Visual Studio Code**: Foundation tool used in all my coding, used for the database management/interaction and executing SQL queries
- **Git & GitHub**: Essential for version control and sharin my SQL scripts and analysis, ensuring collaboration and project management
# Analysis
Each query for this project aimed to uncover insights into the data job market. Each query built on the previous, allowing for further investigations and findings. Here's how I approached each question:

### 1. Top Paying Analyst Jobs
To identify the highest-paying roles, I filtered analyst positions by average yearly salary and location. This query highlights the high paying opporuntities in the field.

```sql
SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date:: DATE
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title LIKE '%Analyst%' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
Here's a breakdown of the top analyst jobs:
- **Wide Salarry Range:** Top 10 paying analyst roles range from $185,000 to $650,000, indicting significant salary potential within the field.
- **Diverse Employers:** There is a diverse range of companies within the top 10 roles, showing a broad interest across different industries
- **Job Title Variety:** The results show a diversity of job titles, from the general 'Data Analyst' to 'Director of Analytics', reflecting varied roles and specializations within the analytical field.

![Top Paying Roles](Assets\1_top_paying_roles.png)
# Learning Outcomes

# Conclusions

