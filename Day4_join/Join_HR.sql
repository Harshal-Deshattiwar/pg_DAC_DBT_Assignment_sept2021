USE hr_schema;

-- 1.) Write a query in SQL to display the first name, last name, department number, and department name for each employee.

SELECT e.first_name,e.last_name, e.department_id,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 2.) Write a query in SQL to display the first and last name, department, city, and state province for each employee

SELECT e.first_name,e.last_name,d.department_name, loc.city, loc.state_province
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations loc on loc.location_id = d.location_id;

-- 3.) Write a query in SQL to display the first name, last name, salary, and job grade for all employees.

SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E 
   JOIN job_grade J
     ON E.salary BETWEEN J.lowest_sal AND J.highest_sal;

-- 4.) Write a query in SQL to display the first name, last name, department number and department name, for all employees for departments 8 or 4.

SELECT e.first_name,e.last_name,e.department_id,d.department_name
FROM employees e 
JOIN departments d ON  d.department_id = e.department_id and d.department_id IN(4,8);

-- 5.) Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province.

SELECT e.first_name,e.last_name, d.department_name, l.city, l.state_province
FROM employees e 
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON l.location_id = d.location_id
WHERE e.first_name LIKE '%z%';

--  6.) Write a query in SQL to display all departments including those where does not have any employee.

SELECT e.first_name, e.last_name, d.department_id, d.department_name
from employees e
RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

-- 7.) Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 182.

SELECT e.first_name, e.last_name,e.salary
from employees e
JOIN employees e2 ON e.salary < e2.salary AND e2.employee_id = 182;

-- 8.) Write a query in SQL to display the first name of all employees including the first name of their manager.

SELECT e1.first_name, e2.first_name
from employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- 9.) Write a query in SQL to display the department name, city, and state province for each department.

SELECT d.department_name,l.city, l.state_province
FROM departments d
JOIN locations l ON l.location_id = d.location_id;

-- 10.) Write a query in SQL to display the first name, last name, department number and name, for all employees who have or have not any department. 

SELECT e.first_name, e.last_name,e.department_id,d.department_name
FROM employees e
LEFT OUTER JOIN departments d ON d.department_id = e.department_id;

-- 11.) Write a query in SQL to display the first name of all employees and the first name of their manager including those who does not working under any manager.

SELECT e.first_name AS 'Employee Name', m.first_name AS 'Manager Name'
FROM employees e
LEFT OUTER JOIN employees m ON e.manager_id = m.employee_id;

-- 12.) Write a query in SQL to display the first name, last name, and department number for those employees who works in the same department as the employee who holds the last name as Taylor.

SELECT E.first_name, E.last_name, E.department_id 
FROM employees E 
JOIN employees S ON E.department_id = S.department_id
AND S.last_name = 'Taylor';

-- 13.) Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997.

SELECT j.job_title, d.department_name,  CONCAT(' ',e.first_name ,'   ', e.last_name) AS employees, e.hire_date
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN jobs j ON j.job_id = e.job_id
WHERE e.hire_date>='1993-01-01' AND e.hire_date<='1997-08-31';

-- 14.) Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee.

SELECT j.job_title, CONCAT(' ', e.first_name, '   ' , e.last_name,' ') AS Employees, 
(j.max_salary - j.min_salary) AS salary_difference,e.salary
FROM employees e
JOIN jobs j USING (job_id);

-- 15.) Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission.

NO comission columb in any table given;

-- 16.) Write a query in SQL to display the full name (first and last name ) of employees, job title and the salary differences to their own job for those employees who is working in the department ID 8.

-- given department id 80 in question but done for department id as 8
SELECT j.job_title, CONCAT(' ', e.first_name, '   ' , e.last_name,' ') AS Employees, j.max_salary-e.salary AS salary_difference
FROM employees e
NATURAL JOIN jobs j
WHERE department_id  = 8;

-- 17. Write a query in SQL to display the name of the country, city, and the departments which are running there.

SELECT c.country_name,l.city, d.department_name 
FROM countries c
JOIN locations l USING (country_id) 
JOIN departments d USING (location_id);

-- 18.) Write a query in SQL to display department name and the full name (first and last name) of the manager

SELECT  d.department_name,CONCAT(' ', e.first_name, '   ' , e.last_name,' ') AS Manager
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id)
JOIN departments d ON e.department_id = d.department_id;


-- 19.) Write a query in SQL to display job title and average salary of employees.

SELECT job_title, AVG(salary) FROM employees 
NATURAL JOIN jobs 
GROUP BY job_title;


-- 20.) Write a query in SQL to display the details of jobs which was done by any of the employees who is presently earning a salary on and above 12000.

SELECT j.job_title FROM jobs j
JOIN employees e USING(job_id)
WHERE e.salary >=12000;

-- 21.) Write a query in SQL to display the country name, city, and number of those departments where at leaste 2 employees are working.

SELECT country_name,city, COUNT(department_id) FROM countries 
JOIN locations USING (country_id) 
JOIN departments USING (location_id) 
WHERE department_id IN (SELECT department_id 
						FROM employees 
						GROUP BY department_id 
						HAVING COUNT(department_id)>=2)
						GROUP BY country_name,city;
                        
-- 22.) Write a query in SQL to display the department name, full name (first and last name) of manager, and their city.

SELECT d.department_name, CONCAT(' ', e.first_name, '     ' , e.last_name,' ') AS Manager, l.city, e.employee_id
FROM employees e
JOIN employees m ON m.manager_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l USING (location_id)
GROUP BY m.manager_id;
                        
                        
 -- 23.) Write a query in SQL to display the employee ID, job name, number of days worked in for all those jobs in department 80.
 
-- NO job_history table given (CANT BE SOLVED)
                        
-- 24.) Write a query in SQL to display the full name (first and last name), and salary of those employees who working in any department located in London.
SELECT CONCAT(' ', e.first_name, '       ', e.last_name,' ') AS Employee,e.salary
FROM employees e
JOIN departments USING (department_id) JOIN  locations USING (location_id) WHERE  city = 'London';

-- 
-- 25.)  Write a query in SQL to display full name(first and last name), job title, starting and ending date of last jobs for those employees with worked without a commission percentage
                        
-- No job history table and commision columb in employees table

-- 26.) Write a query in SQL to display the department name and number of employees in each of the department.

SELECT d.department_name,count(e.employee_id) AS no_of_employees, d.department_id
FROM departments d
JOIN employees e using (department_id)
GROUP BY d.department_id;

-- 27.) Write a query in SQL to display the full name (firt and last name ) of employee with ID and name of the country presently where (s)he is working.

SELECT CONCAT(' ' , first_name, ' ' , last_name), employee_id,c.country_name
from employees e
JOIN departments d USING(department_id)
JOIN locations l USING (location_id)
JOIN countries c using(country_id);
