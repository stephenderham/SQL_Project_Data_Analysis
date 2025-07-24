-- Sub query
SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
    ORDER BY company_id
);

-- CTE
WITH company_job_count AS (
SELECT
    company_id,
    count(*) AS total_jobs
FROM 
    job_postings_fact
GROUP BY
    company_id
)

Select
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON
    company_job_count.company_id = company_dim.company_id 
ORDER BY total_jobs DESC;

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON
        job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        job_postings_fact.job_work_from_home = TRUE AND
        job_postings_fact.job_title_short LIKE '%Data Analyst%'
    GROUP BY skill_id
    LIMIT 200
)

SELECT 
    skills_dim.skill_id,
    skills as skill_name,
    skill_count
from remote_job_skills
INNER JOIN skills_dim ON
    skills_dim.skill_id = remote_job_skills.skill_id 
ORDER BY skill_count DESC
LIMIT 5



