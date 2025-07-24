SELECT 
    quarter1.job_title_short,
    quarter1.job_location,
    quarter1.job_via,
    quarter1.job_posted_date::date,
    quarter1.salary_year_avg
FROM (
SELECT *
FROM
    january_jobs
UNION ALL
SELECT *
FROM
    february_jobs
UNION ALL
SELECT *
FROM
    march_jobs
) AS quarter1
WHERE quarter1.salary_year_avg > 70000
ORDER BY quarter1.salary_year_avg DESC

