-- List the following details of each employee, 
-- employee number, first name, last name, sex, salary 
SELECT employees.emp_no, first_name, last_name, sex, salary
from employees
left join salaries on employees.emp_no = salaries.emp_no;