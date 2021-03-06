QUESTION
***********************************************************************************************************************

Assumption : We have created Scott schema (database) in MySQL and created following tables using attached script
EMP
DEPT
SALGRADE
BONUS



Questions on SELECT Clause
----------------------------------------
1. Display all the records in emp table
2. Display first two column from emp table
3. Display the structure of emp, dept and salgrade table
4. Display unique jobs from employee table
5. Display the output as follows 
          SCOTT is earning 800 dollars
          ...
6. Display the output from employee table in following format

 Employee Name  Designation 
-----------------------   ---------------------
 SMITH                 CLERK
 ALLEN                 SALESMAN
...

7. Display the name of employee and annual salary of each employee. Annual sal must be calculated by considering sal, comm and bonus of 1000$ for each employee

8. Display the list of manager's employee number in following format. Ensure that same manager number must not be repeated. Also ensure that NULL must not be displayed in the result (display NA in place of null)

Manager Number
------------------------
7902
7698
7839
7566

9. Display the employee name, salary and commission and ensure that we consider the commission as 1500 for employees where commission is not paid.

Questions on WHERE Clause
----------------------------------------
1. List the employees who are working in department 10
2. List the name and salary of employees who are working as CLERK and SALESMAN
3. List the name of employees who have joined the company after year 1981
4. List the name of employees who have joined the company in year 1981
5. List the details of employees who are working as CLERK and earning more then 1000$
6. List the details of employees who are not managed by any manager
7. List the name of employees who are not earning any commission
8. List the details of employees whose total salary (sal and commission) is more then $2000.

9. List the details of employees which are working as SALESMAN in department 10 and 30.

10. List details of employees who are working as SALESMAN in department 30 and earning some commission



Questions on Information schema
---------------------------------------------
1. Identify and query the data dictionaries which can provide following details
      - List of tables in scott schema
      - List of columns and correspondings data types of all the tables in scott schema
2. Fetch list of all data dictionary in information schema and observe there naming convention
3. List all data dictionary whose name have 'col' keyword in it.