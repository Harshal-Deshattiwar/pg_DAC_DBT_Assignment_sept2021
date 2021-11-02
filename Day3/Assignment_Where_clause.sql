1. Display the Supplier table in the descending order of CITY.

> select * from supplier order by city desc;


2. Display the Part Table in the ascending order of CITY and within the city in
the ascending order of Part names.

> select * from parts order by city,Pname asc;


3. Display all the Suppliers with a status between 10 and 20.

> select Sname from supplier where Status between 10 and 20;

 

4. Display all the Parts and their Weight, which are not in the range of 10 and 15.

> select Pname, Weight from parts where Weight Not between 10 and 15;




5. Display all the Part names starting with the letter ‘S’.

> select Pname from parts where Pname like 'S%';



6. Display all the Suppliers, belonging to cities starting with the letter ‘L’.

> select Sname from supplier  where city like 'L%';



7. Display all the Projects, with the third letter in JNAME as ‘n

> select * from projects where city Jname '__n%';