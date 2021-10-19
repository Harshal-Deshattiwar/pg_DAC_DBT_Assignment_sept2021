USE SCOTT;
SELECT *
FROM EMP;
-- 1. List the employees who are working in department 10

SELECT ENAME
FROM EMP
WHERE DEPTNO=10;

-- 2. List the name and salary of employees who are working as CLERK and SALESMAN

SELECT ENAME,SAL
FROM EMP
WHERE JOB = 'CLERK'
OR JOB = 'SALESMAN';

-- 3. List the name of employees who have joined the company after year 1981

SELECT ENAME
FROM EMP
WHERE YEAR(HIREDATE) > 1981;

-- 4. List the name of employees who have joined the company in year 1981

SELECT ENAME
FROM EMP
WHERE YEAR(HIREDATE) = 1981;

-- 5. List the details of employees who are working as CLERK and earning more then 1000$

SELECT *
FROM EMP
WHERE JOB = 'CLERK'
AND SAL > 1000;

-- 6. List the details of employees who are not managed by any manager

SELECT * 
FROM EMP
WHERE MGR IS NULL;

-- 7. List the name of employees who are not earning any commission

SELECT ENAME
FROM EMP
WHERE COMM IS NULL;


-- 8. List the details of employees whose total salary (sal and commission) is more then $2000.

SELECT ENAME AS 'EMPLOYEE'
FROM EMP
WHERE (SAL + IFNULL(COMM,0)) > 2000;

-- 9. List the details of employees which are working as SALESMAN in department 10 and 30.

SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
AND DEPTNO IN (10,30) ;

-- 10. List details of employees who are working as SALESMAN in department 30 and earning some commission

SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
AND DEPTNO = 30
AND COMM > 0;
