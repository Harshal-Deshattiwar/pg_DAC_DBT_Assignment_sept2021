USE supplier_db;

SELECT * FROM parts;
SELECT * FROM orders;
SELECT * FROM suppliers;

-- #1 Display all the Suppliers with the same Status as the supplier, ‘CLARK’.

SELECT sname,status
from suppliers
 WHERE status =(SELECT Status
				FROM suppliers
                WHERE sname = 'Clark');
                
-- #2 Display all the Employees in the same department as the employee ‘MILLER’.
USE scott;
SELECT ename,deptno
from emp
WHERE deptno = (SELECT deptno
				FROM emp
				WHERE ename = 'MILLER');

-- #3 Display all the Parts which have more Weight than all the Red parts.
USE supplier_db;

SELECT pname, color, weight FROM parts
WHERE weight >= (SELECT max(weight) FROM parts
				WHERE color = 'Red');

-- # 4 Display all the Projects going on in the same city as the project ‘TAPE’.

-- #5 Display all the Parts with Weight less than all the Green parts.
SELECT pname, color, weight FROM parts
WHERE weight < (SELECT max(weight) FROM parts
				WHERE color = 'Green');
                
-- #6 Display the name of the Supplier who has sold the maximum Quantity (in one sale).
SHOW tables;

SELECT s.sname, o.qty FROM orders o, suppliers s
WHERE s.snum = o.snum
AND o.qty = (SELECT max(qty) FROM orders);

-- #7 Display the name of the Employee with the minimum Salary.
USE scott;
SELECT* FROM emp;

SELECT ename, sal FROM emp
HAVING sal = min(sal);

-- #8 Display the name of the Supplier who has sold the maximum overall Quantity (sum of Sales).

USE supplier_db;
SELECT sname FROM suppliers
WHERE snum = 
			(SELECT snum from orders
			GROUP BY snum
			HAVING sum(qty) =
							(SELECT max(quant)
							from (SELECT sum(qty) as quant 
									FROM orders GROUP BY snum) AS orders_details));

(SELECT snum as supplier_num, sum(qty) as quant 
		FROM orders GROUP BY snum);
        
        
-- #9 Display the name of the Department with the maximum number of Employees.
USE scott;
SELECT * FROM dept;
SELECT * FROM emp;

SELECT dname,deptno from dept
WHERE deptno = (SELECT deptno FROM emp
				GROUP BY deptno
				HAVING count(empno) =(SELECT max(emp_count) 
										FROM(SELECT count(empno) as emp_count
										FROM emp
										GROUP BY deptno) AS total_count));
                                        
