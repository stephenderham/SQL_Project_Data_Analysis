SELECT 
    job_title_short AS title,
    job_location AS location, 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AEST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
    job_postings_fact
LIMIT
5;

SELECT  
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date) AS month 
FROM
    job_postings_fact
WHERE
    job_title_short LIKE '%Data Analyst%'
GROUP BY
    month
ORDER BY
    month ASC;

Select * from job_postings_fact limit 100

SELECT
    job_schedule_type,
    avg(salary_hour_avg) AS average_hourly,
    avg(salary_year_avg) AS average_yearly,
    count(job_id) AS number_of_jobs 
FROM
    job_postings_fact 
WHERE 
    EXTRACT(month from job_posted_date) >= 6 and
    EXTRACT(year from job_posted_date) >= 2023
GROUP BY
    job_schedule_type
order BY
    count(job_id) DESC
LIMIT 100;

SELECT
    count(job_id) as number_of_jobs,
    EXTRACT(month from job_posted_date) as date_month
FROM
    job_postings_fact
GROUP BY
    date_month
ORDER BY
    date_month ASC;

SELECT
    name,
    count(job_id) as job_listings
FROM
    company_dim
LEFT JOIN job_postings_fact
    on company_dim.company_id = job_postings_fact.company_id
WHERE
    EXTRACT(MONTH from job_posted_date) > 3 and 
    EXTRACT(MONTH from job_posted_date) <= 6 and
    job_health_insurance = TRUE
GROUP BY
    name
ORDER BY
    job_listings DESC
LIMIT 100;


