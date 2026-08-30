SELECT 
    job_title,
    AVG(salary_year_avg), 
    AVG(salary_hour_avg)
FROM job_postings_fact
WHERE job_posted_date >= '2023-06-01'
GROUP BY job_title;




SELECT
    job_id,

FROM
     job_postings_fact
GROUP BY date_month
ORDER BY date_month;

