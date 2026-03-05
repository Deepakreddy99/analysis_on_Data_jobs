SELECT 
   sd.skills,
   sc.skill_count
FROM skills_dim as sd
JOIN(
SELECT sj.skill_id,
    count (sj.job_id) as skill_count 
FROM  skills_job_dim AS sj 
JOIN job_postings_fact as jp ON sj.job_id = jp.job_id
WHERE job_title_short = 'Data Analyst'
GROUP BY sj.skill_id
) as sc ON sd.skill_id = sc.skill_id
ORDER BY sc.skill_count DESC
LIMIT 10 ;


SELECT
    skills ,
    count(jp.job_id) as demand_count 
FROM job_postings_fact jp
JOIN skills_job_dim as sj ON jp.job_id = sj.job_id
JOIN skills_dim AS sd ON sd.skill_id = sj.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10


