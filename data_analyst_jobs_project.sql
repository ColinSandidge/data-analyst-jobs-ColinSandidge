
--Q1 - 1793 rows
SELECT *
FROM data_analyst_jobs;


--Q2 - ExxonMobil is company in 10th row
SELECT *
FROM data_analyst_jobs
LIMIT 10;


--Q3 - 21 postings in TN; 27 postings in TN + KY
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';


--Q4 - 3 postings in TN w/ star_rating > 4
SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;


--Q5 - 151 postings w/ review count between 500 and 1000
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 and 1000;


--Q6 - NE shows highest avg star_rating
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location;


--Q7 - 881 unique job titles in table
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;


--Q8 - 230 unique job titles in CA
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';


--Q9 - 40 companies w/ 5000+ reviews **SUM OF REVIEWCOUNT>5000**
SELECT company, AVG(star_rating) AS avg_rating, SUM(review_count) as sum_review
FROM data_analyst_jobs
WHERE company IS NOT NULL
AND review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;


--Q10 - Kaiser Permanente has highest star rating at ~4.2 w/ most reviews
SELECT company, AVG(star_rating) AS avg_rating, SUM(review_count) as sum_review
FROM data_analyst_jobs
WHERE company IS NOT NULL
AND review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;


--Q11 - 754 different job titles with Analyst somewhere in it
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';


--Q12 - Tableau is common word in these listings
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND 
	  title NOT ILIKE '%Analytics%';


--BONUS - Internet & Software, Banks & Financial Service, Consulting & Business Services
--Industry: #1 - 62 jobs; #2 - 61 jobs; #3 - 57 jobs; #4 - 52 jobs
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain
ORDER BY COUNT(title) DESC;
