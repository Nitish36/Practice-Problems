SELECT company,ROUND((employees_fired/company_size)*100,2)
FROM tech_layoffs
ORDER BY company;
