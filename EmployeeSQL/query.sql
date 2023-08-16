-- List of: employee number, last name, first name, gender, and salary:
SELECT e.emp_no, last_name, first_name, gender, salary
FROM employee AS e
LEFT JOIN salary AS s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no ASC;

--List of employees who were hired in 1986:
SELECT emp_no, last_name, first_name, gender, hire_date
FROM employee
WHERE hire_date>'1985-12-31'
	AND hire_date<'1987-01-01'
--order by hire_date asc
--order by hire_date desc
ORDER BY emp_no ASC;

--List of MANAGERS from each department with the following information: 
--department number,
--department name, 
--the manager's employee number,
--last name,
--first name,
--and start and end employment dates.
SELECT dm.dept_no,
		d.dept_name, 
		dm.emp_no, 
		e.last_name, 
		e.first_name, 
		de.from_date,
		de.to_date
FROM dept_emp AS de
JOIN department AS d
ON de.dept_no=d.dept_no
JOIN dept_manager AS dm
ON de.emp_no=dm.emp_no
JOIN employee AS e
ON de.emp_no=e.emp_no
ORDER BY emp_no ASC;

--List of each employee's DEPARTMENT with the following information: 
--employee number, 
--last name, 
--first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN department AS d
ON de.dept_no=d.dept_no;

-- List of all employees whose FIRST NAME is "Hercules" and LAST NAMES begin with "B":
SELECT emp_no, first_name, last_name
FROM employee
WHERE first_name='Hercules'
	AND last_name LIKE 'B%';
	
--List of all employees in the SALES department, including:
--their employee number, 
--last name, 
--first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN department AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales'
ORDER BY emp_no ASC;

--List of all employees in the SALES and DEVELOPMENT departments, including: 
--their employee number, 
--last name, 
--first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN department AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales'
	OR d.dept_name='Development';

--List of the FREQUENCY count OF employee LAST NAMES in descending order:
SELECT last_name, COUNT(last_name) AS emp_count_by_last_name
FROM employee
GROUP BY last_name
ORDER BY emp_count_by_last_name DESC;
