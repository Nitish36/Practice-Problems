SELECT DISTINCT COUNT(company_id) as co_w_duplicate_jobs
FROM job_listings
GROUP BY company_id
HAVING COUNT(company_id)>2;
