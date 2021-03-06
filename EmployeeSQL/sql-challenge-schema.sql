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
