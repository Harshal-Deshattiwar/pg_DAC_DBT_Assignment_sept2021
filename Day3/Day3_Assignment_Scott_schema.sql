-- 1) Display all the records in emp table?
SELECT * FROM EMP;

-- 2) Display all the records in emp table where employee belongs to deptno 10?
SELECT *
FROM EMP
WHERE EMP.`DEPTNO` = 10;

-- 3) Display all the records in emp table where employee does not belong to deptno 30?
SELECT *
FROM EMP
WHERE EMP.`DEPTNO`<> 30;

-- 4) Display total number of records in Emp table?
SELECT COUNT(*)
FROM `EMP`;

-- 5) Display emp table with salary descending order?
SELECT *
FROM `EMP`
ORDER BY `SAL` DESC;

-- 6) Display all the records in emp table order by ascending deptno, descending salary?
SELECT *
FROM `EMP`
ORDER BY `DEPTNO`, `SAL` DESC;

-- 7) Display all employees those who were joined in year 1981?
SELECT *
FROM `EMP`
WHERE YEAR(`HIREDATE`) = 1981;


-- 8) Display COMM in emp table. Display zero in place of null.
SELECT IFNULL(`COMM`, 0)
FROM `EMP`;

-- 9) Display the records in emp table where MGR in 7698,7566 and sal should be greater then 1500
SELECT *
FROM `EMP`
WHERE `MGR` IN (7698, 7566) AND
      `SAL` > 1500;

-- 10) Display all employees where employees hired before 01-JAN-1981
SELECT `ENAME`
FROM `EMP`
WHERE `HIREDATE` < '1981-01-01';

-- 11) Display all employees with how many years they have been servicing in the company?
SELECT `ENAME`,
       ABS(TIMESTAMPDIFF(YEAR, CURRENT_TIMESTAMP, HIREDATE)) AS SERVICE_YEARS
FROM `EMP`;

-- 12) Display all employees those were not joined in 1981?
SELECT `ENAME`
FROM `EMP`
WHERE YEAR(`HIREDATE`) != 1981;

-- 13) Display all employees where their salary is less then the Ford’s salary?
SELECT `ENAME`
FROM `EMP`
WHERE SAL < (SELECT `SAL`
             FROM `EMP`
             WHERE `ENAME` = 'FORD');

-- 14) Display all records in EMP table those were joined before SCOTT joined?
SELECT *
FROM `EMP`
WHERE `HIREDATE` < (SELECT `HIREDATE`
                    FROM `EMP`
                    WHERE `ENAME` = 'SCOTT');


-- 15) Display all employees those who were joined in third quarter of 1981?
SELECT `ENAME`
FROM `EMP`
WHERE `HIREDATE` IN (SELECT `HIREDATE`
                     FROM `EMP`
                     WHERE YEAR(`HIREDATE`) = 1981 AND
                           QUARTER(`HIREDATE`) = 3);

-- 16) Write a query to display current date?
SELECT CURRENT_DATE;

-- 17) Display distinct job from emp table?
SELECT DISTINCT `JOB`
FROM `EMP`;

-- 18) Display all the records in emp table where employee hired after 28-SEP-81 and before 03-DEC-81?
SELECT *
FROM `EMP`
WHERE `HIREDATE` > '1981-09-28' AND
      `HIREDATE` < '1981-12-03';

-- 19) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J, A, or M
SELECT CONCAT(UPPER(SUBSTR(`ENAME`, 1, 1)),
              LOWER(SUBSTR(`ENAME`,2))) AS EmpNames
FROM `EMP`;


-- 20) Display the empno, ename, sal, and salary increased by 15%.
SELECT `EMPNO`,
       `ENAME`,
       `SAL`,
       `SAL` + `SAL` * 0.15 AS 'SALARY_115PERC'
FROM `EMP`;

-- 21) Display all employees where ename start with J and ends with S
SELECT `ENAME`
FROM `EMP`
WHERE `ENAME` LIKE 'J%S';

-- 22) Display all employees where employee does not belong to 10,20,40
SELECT `ENAME`
FROM `EMP`
WHERE `DEPTNO` NOT IN (10, 20, 40);

-- 23) Display all employees where jobs does not belong to PRESIDENT and MANAGER?
SELECT `ENAME`
FROM `EMP`
WHERE `JOB` NOT IN ('PRESIDENT', 'MANAGER');

-- 24) Display the maximum salary in the emp table
SELECT MAX(`SAL`) AS 'MAXIMUM_SALARY'
FROM EMP;

-- 25) Display average salary for job SALESMAN
SELECT AVG(`SAL`) AS 'SALESMAN_AVG_SAL'
FROM EMP
WHERE `JOB` = 'SALESMAN';

-- 26) Display all three figures salary in emp table
SELECT SAL
FROM EMP
WHERE SAL BETWEEN 100 AND 999;

-- 27) Display all records in emp table for employee who does not receive any commission
SELECT *
FROM EMP
WHERE `COMM` IS NULL OR
      `COMM` = 0;

-- 28) Display all ename where first character could be anything, but second character should be L?
SELECT `ENAME`
FROM `EMP`
WHERE `ENAME` LIKE '_L%';

-- 29) Display sum of salary for each department.
SELECT DEPT.DNAME, IFNULL(SUM(EMP.`SAL`), 0) 'SUM_SAL'
FROM EMP RIGHT OUTER JOIN `DEPT` ON EMP.`DEPTNO` = `DEPT`.`DEPTNO`
GROUP BY DEPT.DNAME;

-- 30) Display all department with Minimum salary and maximum salary?
SELECT DEPT.DNAME, IFNULL(MIN(`SAL`), 0) 'MIN_SAL', IFNULL(MAX(`SAL`), 0) 'MAX_SAL'
FROM EMP RIGHT OUTER JOIN `DEPT` ON EMP.`DEPTNO` = `DEPT`.`DEPTNO`
GROUP BY DEPT.DNAME;

-- 31) Display all the departments where department does not have any employees
SELECT DEPT.DNAME
FROM EMP RIGHT OUTER JOIN `DEPT` ON EMP.`DEPTNO` = `DEPT`.`DEPTNO`
GROUP BY DEPT.DNAME
HAVING COUNT(EMP.`DEPTNO`) = 0;

-- 32) Display all the departments where department does have atleast one employee
SELECT DEPT.DNAME
FROM EMP RIGHT OUTER JOIN `DEPT` ON EMP.`DEPTNO` =
`DEPT`.`DEPTNO`
GROUP BY DEPT.DNAME
HAVING COUNT(EMP.`DEPTNO`) > 0;

-- 33) Display all employees those who are not managers?
SELECT `ENAME`
FROM `EMP`
WHERE `EMPNO` NOT IN (SELECT `MGR`
                  FROM EMP
                  WHERE `MGR` IS NOT NULL);

-- 34) Display all the records for deptno which belongs to employee name JAMES?
SELECT *
FROM `EMP`
WHERE `DEPTNO` = (SELECT `DEPTNO`
                  FROM `EMP`
                  WHERE `ENAME` = 'JAMES');

-- 35) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
SELECT *
FROM `EMP`
WHERE `SAL` <= (SELECT `SAL`
                FROM `EMP`
                WHERE `ENAME` = 'ADAMS');

-- 36) Display all employees those were joined before employee WARD joined?
SELECT `ENAME`
FROM `EMP`
WHERE `HIREDATE` < (SELECT `HIREDATE`
                    FROM `EMP`
                    WHERE `ENAME` = 'WARD');

-- 37) Display all subordinate those who are working under BLAKE?
SELECT `ENAME`
FROM `EMP`
WHERE MGR =
(SELECT `EMPNO`
FROM `EMP`
WHERE `ENAME` = 'BLAKE');

-- 38) Display all subordinate(all levels) for employee BLAKE?
SELECT `ENAME`
FROM `EMP`
WHERE `MGR` = (SELECT `EMPNO`
              FROM `EMP`
              WHERE `ENAME` = 'BLAKE') OR
      `MGR` IN (SELECT `EMPNO`
                FROM `EMP`
                WHERE MGR =
                (SELECT `EMPNO`
                FROM `EMP`
                WHERE `ENAME` = 'BLAKE'))

-- 39) Display all record in emp table for deptno which belongs to KING's Job?
SELECT *
FROM `EMP`
WHERE `DEPTNO` IN
(SELECT `DEPTNO`
FROM `EMP`
WHERE `JOB` =
(SELECT `JOB`
FROM `EMP`
WHERE `ENAME` = 'KING'));

-- 40) Display the employees for empno which belongs to job PRESIDENT?
SELECT *
FROM `EMP`
WHERE `EMPNO` IN
(SELECT `EMPNO`
FROM `EMP`
WHERE JOB = 'PRESIDENT');

-- 41) Display list of ename those who have joined in Year 81 as MANAGER?
SELECT `ENAME`
FROM `EMP`
WHERE YEAR(`HIREDATE`) = 1981 AND
      `JOB` = 'MANAGER';

-- 42) Display who is making highest commission?
SELECT `ENAME`
FROM `EMP` e
WHERE `COMM` =
(SELECT MAX(`COMM`)
FROM `EMP`);

-- 43) Display who is senior most employee? How many years has been working?
SELECT `ENAME`,
ABS(TIMESTAMPDIFF(YEAR, `HIREDATE`, CURRENT_DATE)) AS YEARS_WORKING
FROM EMP
HAVING YEARS_WORKING = MAX(YEARS_WORKING);

-- 44) Display who is most experienced and least experienced employee?
SELECT `ENAME`,
ABS(TIMESTAMPDIFF(YEAR, `HIREDATE`, CURRENT_DATE)) AS YEARS_WORKING
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) OR
HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

-- 45) Display all employee whose location is DALLAS?
SELECT `ENAME`
FROM EMP
WHERE `DEPTNO` IN
(SELECT `DEPTNO`
FROM `DEPT`
WHERE `LOC` = 'DALLAS');

-- 46) List ename, job, sal and department of all employees whose salary is not within the salary grade?
SELECT e.`ENAME`, e.`JOB`, e.`SAL`, s.`GRADE`, d.`DNAME`
FROM `EMP` e, `SALGRADE` s, `DEPT`d
WHERE e.`SAL` BETWEEN s.`LOSAL` AND s.`HISAL` AND
e.`DEPTNO` = d.DEPTNO;