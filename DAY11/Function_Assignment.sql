

-- 1. Write a program to take the input as empno and return the experience of employee in terms of number of years.
delimiter //
DROP FUNCTION IF EXISTs no_of_exp;
CREATE FUNCTION no_of_exp (emp_no int)
RETURNS INT
DETERMINISTIC
BEGIN

DECLARE exp_var int;

SELECT timestampdiff(year, hiredate, sysdate()) into exp_var
FROM emp 
WHERE empno = emp_no;

RETURN exp_var;

END//


SELECT ename,no_of_exp (7934) as experience from emp
WHERE empno = 7934;


-- 2. Write a program to take the input as deptno and return the comma separated list of employee names

delimiter //
CREATE FUNCTION comma_separated(dept_no INT) RETURNS varchar(100)
DETERMINISTIC
BEGIN
DECLARE names_var VARCHAR(100);

SELECT group_concat(ename) into names_var
FROM emp WHERE deptno = dept_no;

RETURN names_var;
END //

DELIMITER //

SELECT DEPTNO, comma_separated(10) FROM emp
WHERE deptno = 10 GROUP BY deptno;


-- 3. Add a new column incentive to emp table. Write a program to calculate and update the incentive using following logic.
-- 		If employees salary is more then avg salary of dept then incentive is 0
-- 		If employees salary is less then avg salary of dept then incentive is 10% of salary

DELIMITER #
	CREATE FUNCTION getIncentives
	(
		p_empno INTEGER
	)
	RETURNS DECIMAL
	DETERMINISTIC
	BEGIN
		DECLARE inct DECIMAL;
DECLARE salary DECIMAL;
DECLARE avg_sal DECIMAL;
DECLARE dept INTEGER;

SELECT deptno INTO dept
FROM emp
WHERE empno = p_empno;

SELECT avg(sal) INTO avg_sal
FROM emp
GROUP BY deptno
HAVING deptno = dept;

SELECT sal INTO salary
FROM emp
WHERE empno = p_empno;

IF salary < avg_sal THEN
SET inct = 0.1 * salary;
ELSE 
SET inct = 0;
END IF;    

update emp 
SET incentive = round(inct)
WHERE empno = p_empno;

RETURN 0;
	END#
	
	DELIMITER #
     
-- 4. Write a program to get the count of employees working in provided deptno

delimiter //
create function p_count(p_deptno int)
returns int
deterministic

begin  
  declare v_count int;
  
  select count(*) into v_count
  from emp 
  where deptno=p_deptno;
  
  return v_count;
  
  end //
