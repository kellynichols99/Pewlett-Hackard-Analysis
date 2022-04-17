--DELIVERABLE 1 Steps 1-7
SELECT employees.emp_no, 
employees.first_name, 
employees.last_name, 
titles.title, 
titles.from_date, 
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no

--Checking table
SELECT * FROM retirement_titles

-- Steps 8-10 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Steps 16-21
SELECT COUNT (unique_titles.emp_no),
unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;
