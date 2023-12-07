CREATE TABLE employee (emp_no INT
					   ,emp_title_id VARCHAR ,
					   birth_date DATE,
					   first_name VARCHAR,
					   last_name VARCHAR,
					   sex VARCHAR,
					  hire_date DATE,
					  PRIMARY KEY (emp_no)
					  );
					  
SELECT * FROM employee

CREATE TABLE departments (dept_no VARCHAR, dept_name VARCHAR, PRIMARY KEY (dept_no));
SElECT * From departments;

CREATE TABLE employee_department (emp_no INT, dept_no VARCHAR, FOREIGN KEY (emp_no) REFERENCES employee (emp_no), Foreign Key (dept_no) REFERENCES deartments (dept_no));
SELECT * FROM employee_department;

CREATE TABLE department_manager(dept_no VARCHAR, emp_no INT, FOREIGN KEY (emp_no) REFERENCES employee (emp_no), Foreign Key (dept_no) REFERENCES deartments (dept_no));

SELECT * From department_manager;

CREATE TABLE salaires (emp_no INT, salary int,FOREIGN KEY (emp_no) REFERENCES employee (emp_no));
SELECT * From salaires

CREATE TABLE title (title_id VARCHAR, title VARCHAR,FOREIGN KEY (emp_no) REFERENCES employee (emp_no));
SELECT * from title;

SELECT emp.emp_no,emp.last_name, emp.first_name, emp.sex, sal.salary
From employee as emp
join
salaires as sal
ON emp.emp_no=sal.emp_no;

SELECT emp.first_name, emp. Last_name, emp.hire_date
from employee AS emp
WHERE EXTRACT (year From emp.hire_date)=1986;

SELECT dman.dept_no, d.dept_name, emp.last_name, emp.first_name
FROM department_manager AS dman
JOIN employee AS emp
ON emp.emp_no = dman.emp_no
JOIN
departments AS d
ON dman.dept_no=d.dept_no;

SELECT d.dept_no, ed.emp_no, emp.last_name, emp.first_name, d.dept_name
From departments AS d
JOIN employee_department as ed
ON d.dept_no = ed.dept_no
Join 
employee as emp
ON ed.emp_no = emp.emp_no;

SELECT emp.first_name, emp.last_name, emp.sex
FROM employee AS emp
Where first_name = 'Hercules'
AND last_name Like 'B%';

Select emp.emp_no, emp.last_name, emp.first_name
FROM employee AS emp
Where emp. emp_no IN
(select ed.emp_no From employee_department AS ed
where ed.dept_no= (Select d.dept_no 
From departments As d
Where d.dept_name = 'Sales'));

SELECT ed.emp_no, emp. last_name, emp.first_name, d.dept_name
FROM employee AS emp
Join employee_department AS ed
on emp.emp_no = ed.emp_no
Join 
departments AS d
on ed.dept_no = d.dept_no
WHERE d.dept_name ='Sales'
or d. dept_name = 'Development';

Select emp.last_name, COUNT(emp.last_name) AS last_name_count
From employee AS emp
Group BY emp.last_name
Order By last_name DESC;