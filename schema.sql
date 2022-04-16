-- Creating tables for PH-EmployeesDB
CREATE TABLE departments(
dept_no VARCHAR(4) NOT NULL, 
dept_name VARCHAR(40) NOT NULL, 
PRIMARY KEY (dept_no), 
UNIQUE (dept_name)
);

CREATE TABLE employees(
emp_no INT NOT NULL, 
birth_date DATE NOT NULL, 
first_name VARCHAR NOT NULL, 
last_name VARCHAR NOT NULL, 
gender VARCHAR NOT NULL, 
hire_date DATE NOT NULL, 
PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR(4) NOT NULL, 
	emp_no INT NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
emp_no INT NOT NULL, 
salary INT NOT NULL, 
from_date DATE NOT NULL, 
to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  PRIMARY KEY (emp_no,dept_no)
);

 CREATE TABLE titles(
emp_no INT NOT NULL, 
title VARCHAR NOT NULL, 
from_date DATE NOT NULL, 
to_date DATE NOT NULL
);

-- General search for employees in retirement age
SELECT first_name, last_name

FROM employees

WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility (last line has a tuple)
                                                                                                                                          

-- number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')


--Create a table with the retirement info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--view previous table
SELECT * FROM retirement_info;

--WE dropped the retirement info table

--Create a new table for retireing employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Check the table
SELECT * FROM retirement_info

--Joining departments and dept_manager tables
SELECT departments.dept_name, 
dept_manager.emp_no, 
dept_manager.from_date, 
dept_manager.to_date, 
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

