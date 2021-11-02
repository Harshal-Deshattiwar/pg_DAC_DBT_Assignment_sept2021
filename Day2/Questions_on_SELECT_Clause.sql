USE SCOTT;
SHOW TABLES;

-- 1. Display all the records in emp table
select *
from emp;

-- 2. Display first two column from emp table
SELECT EMPNO,ENAME
FROM EMP;

-- 3. Display the structure of emp, dept and salgrade table
DESCRIBE EMP;
DESCRIBE DEPT;
DESCRIBE SALGRADE;


-- 4. Display unique jobs from employee table

SELECT DISTINCT JOB FROM EMP;

-- 5. Display the output as follows 
--          SCOTT is earning 800 dollars

SELECT CONCAT(ENAME,' IS EARNING ' ,SAL,' DOLLARS') AS EMPLOYEE FROM EMP;



-- 6. Display the output from employee table in following format

-- Employee Name                Designation 
-- -----------------------   ---------------------
 -- SMITH                         CLERK
 -- ALLEN                        SALESMAN
 
SELECT ENAME AS 'EMPLOYEE NAME', JOB AS DESIGNATION FROM EMP;


-- 7. Display the name of employee and annual salary of each employee. Annual sal must be calculated by considering sal, comm and bonus of 1000$ for each employee

SELECT ENAME,(SAL + IFNULL(COMM,0) + 100) aNUALsALARY FROM EMP;

-- 8. Display the list of manager's employee number in following format. Ensure that same manager number must not be repeated. Also ensure that NULL must not be displayed in the result (display NA in place of null)

SELECT DISTINCT (IFNULL(MGR,'NA')) AS 'MANAGER NUMBER' FROM EMP;

-- 9. Display the employee name, salary and commission and ensure that we
-- consider the commission as 1500 for employees where commission is not paid
SELECT ENAME, SAL, IF(COMM=0 OR ISNULL(COMM) ,1500,COMM) AS COMMISSION FROM EMP;

-- ---------------------------------------------------------------------------------------------------------------
-- QUESTIONs ON WHERE CLAUSE
-- --------------------------------------------------------------------------------------------------------------------
-- 1. List the employees who are working in department 10

SELECT `ENAME`
FROM EMP
WHERE `DEPTNO` = 10;

-- 2. List the name and salary of employees who are working as CLERK and
-- SALESMAN

SELECT `ENAME`, `SAL`
FROM EMP
WHERE `JOB` IN ('CLERK', 'SALESMAN');

-- 3. List the name of employees who have joined the company after year 1981

SELECT `ENAME`
FROM EMP
WHERE YEAR(`HIREDATE`) > 1981;

-- 4. List the name of employees who have joined the company in year 1981

SELECT `ENAME`
FROM EMP
WHERE YEAR(`HIREDATE`) = 1981;

-- 5. List the details of employees who are working as CLERK and earning more
-- than 1000$

SELECT *
FROM EMP
WHERE `JOB` = 'CLERK' AND
`SAL` > 1000;

-- 6. List the details of employees who are not managed by any manager

SELECT *
FROM EMP
WHERE `MGR` IS NULL;

-- 7. List the name of employees who are not earning any commission

SELECT `ENAME`
FROM EMP
WHERE `COMM` IS NULL;

-- 8. List the details of employees whose total salary (sal and commission) is
-- more then $2000
SELECT *
FROM EMP
WHERE `SAL` +  IFNULL(`COMM`, 0) > 2000;

-- 9. List the details of employees which are working as SALESMAN in department
-- 10 and 30

SELECT *
FROM `EMP`
WHERE `JOB` = 'SALESMAN' AND
`DEPTNO` IN  (10, 30);

-- 10. List details of employees who are working as SALESMAN in department 30
-- and earning some commission

SELECT *
FROM `EMP`
WHERE `JOB` = 'SALESMAN' AND
`DEPTNO` =  30 AND
`COMM` > 0;

-- ---------------------------------------------------------------------------------------------------------------
-- QUESTIONs ON Information schema
-- --------------------------------------------------------------------------------------------------------------------

-- 1. Identify and query the data dictionaries which can provide following details
-- 		List of tables in scott schema
-- 		List of columns and correspondings data types of all the tables in scott schema
USE information_schema;

SELECT *
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'scott';

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'scott';

-- 2. Fetch list of all data dictionary in information schema and observe there naming convention

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'information_schema';

-- 3. List all data dictionary whose name have 'col' keyword in it.

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'information_schema'
AND TABLE_NAME LIKE '%COL%';

