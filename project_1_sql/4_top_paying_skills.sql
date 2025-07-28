/*
Focus Question: What are the top skills based on slary?
- Look at the average salary associated with each skill for Analyst positions
- Focuses on roles with specified salaries (removing NULL values)
- Why? It reveals how differnt skills impact salary levels for Analysts and 
    helps identity the most financially rewarding skills to learn/improve upon
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE '%Analyst%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25
