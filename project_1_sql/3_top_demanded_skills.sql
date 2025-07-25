/* 
Focus Question: What are the most in-demand skills for analysts?
- Identifying the top 5 most important skills
- Why? Retrieves the top 5 skills with the highest memand in the job market, 
    providing insights into the most valuable skills to learn and develop
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON 
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short LIKE '%Analyst%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
