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


SELECT ENAME, SAL, IF(COMM=0 OR ISNULL(COMM) ,1500,COMM) AS COMMISSION FROM EMP;