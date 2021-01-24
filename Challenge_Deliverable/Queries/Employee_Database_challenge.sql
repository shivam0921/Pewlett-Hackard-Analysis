-----------------------------------------------Deliverable_1-----------------------------------------------------------------------------
Select e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirements_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
DROP table unique_titles

SELECT DISTINCT ON (rt.emp_no)
				rt.emp_no,
				rt.first_name,
				rt.last_name,
				rt.title
INTO unique_titles
FROM retirements_titles as rt
ORDER BY emp_no ASC, to_date DESC;

Select * from unique_titles
-------------------------------------retiring_title_count------------------------------------------------------------------------
DROP TABLE retiring_titles

Select count(title) ,
title
INTO retiring_titles
from unique_titles
GROUP BY title
ORDER BY count(title) DESC;

Select * from retiring_titles
-------------------------------------------Deliverable-2--------------------------------------------------------------------------
Select DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON(e.emp_no = t.emp_no)
WHERE (de.to_date BETWEEN '9999-01-01' AND '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no, e.emp_no DESC;
	
Select * from mentorship_eligibilty
-------------------------------------------------------------------------------------------------------------------------------------
