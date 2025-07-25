/*
Focus Question: What are the top-paying data analytst jobs?
- This will help discover the type of jobs that are the highest paying for a data analyst.
- Focuses on job postings with specified salaries (with steps in removing null values)
- Why? To highlight the top opportunities for a data analyst, offering insights into the job market
*/

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
    job_title LIKE '%Data Analyst%' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;