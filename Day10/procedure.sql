/*

1. Prepare a program which can perform following operation
		- Lookout for tables which has missing constraints
        - Display list of those tables
*/

drop PROCEDURE IF EXISTS missing_constraints;
delimiter //
-- drop PROCEDURE IF EXISTS missing_constraints;
CREATE PROCEDURE missing_constraints()
BEGIN 

	
	(SELECT DISTINCT table_name
    FROM information_schema.TABLES
    WHERE table_schema = 'practice'
    AND table_name NOT IN (SELECT table_name
							FROM information_schema.table_constraints
                            WHERE constraint_schema = 'practice'));
END//



/*
2. Prepare a program to delete the data from emp. It will receive two inputs employee number and employee name. If employee number is passed as null then delete the data based on employee name.
Backup the deleted data to employee_backup table.
*/

delimiter //
DROP PROCEDURE IF EXISTs delete_emp;
CREATE PROCEDURE  delete_emp (IN emp_no int, IN emp_name varchar(64))
BEGIN

DROP TABLE IF EXISTS emp_backup;

CREATE TABLE emp_backup like emp;

IF emp_no IS NULL THEN

	INSERT INTO emp_backup 
	SELECT * FROM emp 
	WHERE ename = 'MARTIN';
    
    DELETE FROM emp WHERE ename = emp_name;
    
ELSE
	DELETE FROM emp WHERE empno = emp_no;

END IF;

END //


/*
3. Prepare a program to insert new record in employee table. it will take the input of employee data.
If salary is provided as null then consider the salary as highest salary earned by any employee in same department. If comm is not provided then assume it as 200$

*/

delimiter //

DROP PROCEDURE IF EXISTS new_record;

CREATE PROCEDURE new_record(enp_num INT, name VARCHAR(20), job VARCHAR(15), mgr INT, hiredate DATE, salary INT, comm INT, dept_num INT)
BEGIN
SET comm=IFNULL(comm, 200);

IF salary IS NULL THEN
	SELECT MAX(salary) into salary FROM emp
    WHERE deptno = dept_num;
END IF;

INSERT INTO emp VALUES(enp_num,name,job,mgr,hiredate,salary,comm,dept_num);

END //

/*
4. Prepare a program to receive the input as table name and column name. Add primary key constraint on provided table's column.
*/

delimiter //

DROP PROCEDURE IF EXISTS Add_primary_key;

CREATE PROCEDURE Add_primary_key (tablename VARCHAR(20), col_name VARCHAR(20))
BEGIN
		SET @query = CONCAT('ALTER TABLE ', tablename, ' ADD PRIMARY KEY ( ', columnname, ' )');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
END //

delimiter ;