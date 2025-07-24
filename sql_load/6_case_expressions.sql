SELECT
    count(job_id) as number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE  
    job_title_short LIKE '%Data Analyst%'
GROUP BY
    location_category;


SELECT
    count(job_id) as number_of_jobs,
    CASE
        WHEN salary_year_avg < 60000 THEN 'Low'
        WHEN salary_year_avg < 100000 AND salary_year_avg > 60000 THEN 'Standard'
        ELSE 'High'
    END As Salary_range
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY Salary_range;


