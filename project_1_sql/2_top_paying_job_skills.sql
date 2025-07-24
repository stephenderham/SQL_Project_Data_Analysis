/*
Focus Question: What skills are required for the top-paying jobs?
- Building on the first query, this query will further delve into the skills needed for these type of roles
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping understand the job market and the skills needed to develop and practice
*/

WITH top_paying_jobs AS ( 
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
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
    LIMIT 50
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON 
    skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY 
    salary_year_avg DESC
