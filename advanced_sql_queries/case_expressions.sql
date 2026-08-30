-- Categorization by Location
SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact


SELECT
    COUNT(job_id),
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

-- Categorization by Salary
SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 150000 THEN 'Low salary'
        WHEN salary_year_avg BETWEEN 150000 AND 300000 THEN 'Standard salary'
        WHEN salary_year_avg > 300000 THEN 'High salary'
        ELSE 'No Information'
    END AS salary_category
FROM job_postings_fact
