WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC




--Skills for a job
WITH remote_job_skills AS (
SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE job_postings.job_work_from_home = TRUE AND job_postings.job_title_short = 'Data Analyst'
GROUP BY skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;



--Practice Problem 1: Top 5 skills
WITH top_skills AS (
SELECT 
    skill_id,
    COUNT (*) AS skill_count
FROM skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
GROUP BY skill_id
)

SELECT
    skills_dim.skill_id,
    skill_count,
    skills_dim.skills AS skill_name
FROM top_skills
INNER JOIN skills_dim ON skills_dim.skill_id = top_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;