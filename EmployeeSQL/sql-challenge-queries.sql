CREATE TABLE departments (
	dept_no		VARCHAR(4)	PRIMARY KEY,
	dept_name	VARCHAR(30)
);

CREATE TABLE titles (
	title_id	VARCHAR(5)	PRIMARY KEY,
	title		VARCHAR(30)
);

CREATE TABLE employees (
	emp_no 		int 		PRIMARY KEY,
	emp_title 	VARCHAR(5),
	birth_date	DATE,
	first_name	VARCHAR(30),
	last_name	VARCHAR(30),
	sex			VARCHAR(5),
	hire_date	DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no		int			PRIMARY KEY,
	salary		int,
	FOREIGN KEY (emp_no) 	REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no		int,
	dept_no		VARCHAR(4),
	FOREIGN KEY (emp_no) 	REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) 	REFERENCES departments(dept_no),
	PRIMARY KEY	(emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no		VARCHAR(4),
	emp_no		int,
	FOREIGN KEY (emp_no) 	REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) 	REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	FROM employees
	INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no
	;
	
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
	FROM employees
	WHERE hire_date BETWEEN '1986-01-01'
	AND '1986-12-31'
	;
	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
	FROM dept_manager
	INNER JOIN departments ON 
	dept_manager.dept_no = departments.dept_no
	INNER JOIN employees ON 
	dept_manager.emp_no = employees.emp_no
	;
	
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no
	;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
	FROM employees
	WHERE employees.first_name LIKE 'Hercules' AND
	employees.last_name LIKE 'B%'
	;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
	;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales' OR
	departments.dept_name = 'Development'
	;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name)
	FROM employees
	GROUP BY employees.last_name
	ORDER BY COUNT(employees.last_name) DESC
	;