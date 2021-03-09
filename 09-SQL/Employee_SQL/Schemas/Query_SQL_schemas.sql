-- Q1. List the following details of each employee, 
-- employee number, first name, last name, sex, salary. 

SELECT employees.emp_no, first_name, last_name, sex, salary
from employees
left join salaries on employees.emp_no = salaries.emp_no
;

-- Q2. List first name, last name, hire date, hired in 1986

SELECT first_name, last_name, hire_date
from employees
WHERE
      hire_date >= '01-01-1986'
  AND hire_date <  '31-12-1986'
;

-- Q3. List the manager of each department with the following information:  
-- department number, department name, the manager's employee number, 
--last name, first name.

SELECT dept_manager.dept_no, departments.dept_name,
dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
left join departments
on dept_manager.dept_no = departments.dept_no
left join employees 
on dept_manager.emp_no = employees.emp_no
order by emp_no
;

-- Q4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
order by emp_no
;

-- Q5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
from employees
where first_name
like 'Hercules%'
and last_name 
like 'B%'
order by last_name asc
;

-- Q6 List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name in ('Sales')
order by emp_no
;

-- Q7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name in ('Sales', 'Development')
order by emp_no
;

-- Q8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) as freq_last_name
from employees
group by last_name
order by freq_last_name desc
;

