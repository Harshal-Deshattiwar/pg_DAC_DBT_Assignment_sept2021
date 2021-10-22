use supplier_db;

show tables;

SELECT * FROM suppliers;
SELECT * FROM orders;
SELECT * FROM parts;

-- #1 Display the minimum Status in the Supplier table.
select * from suppliers;

SELECT sname,min(status) as min_status
from suppliers;


    
-- #2 Display the maximum Weight in the Parts table.

SELECT pname, max(weight) as max_weight
from parts;

-- #3 Display the average Weight of the Parts.

SELECT avg(weight) as avg_weight
from parts;

-- # 4 Display the total Quantity sold for part ‘P1’.

SELECT sum(qty) as TOTAL_QTY_SOLD from orders
where pnum=1;


-- #5 Display the total Quantity sold for each part.
SELECT pnum,sum(qty) as TOTAL_QTY_SOLD from orders
GROUP by pnum;

-- #6 Display the average Quantity sold for each part.

SELECT pnum,avg(qty) as AVG_QTY_SOLD from orders
GROUP by pnum;

-- #7 Display the maximum Quantity sold for each part, provided the maximum Quantity is greater than 800.

SELECT pnum ,max(qty) as MAX_QTY_SOLD from orders
GROUP by pnum
HAVING max(qty) > 800;

-- #8 Display the Status and the count of Suppliers with that Status.
SELECT status, count(sname) as status_count
from suppliers
GROUP BY status
ORDER BY status;

-- #9 Display the count of Projects going on in different cities


-- #10 What is the difference between COUNT(Status) and COUNT(*) ?

select (count(status) - count(*) ) as Difference
from suppliers;


-- #11 Display the Status and the Count of Suppliers with that Status in the following format as shown below:-
-- Status	Count
-- Ten	      1
-- Twenty	  2
-- Thirty	  3

SELECT CASE
    WHEN status = 10 THEN 'Ten'
    WHEN status = 20 THEN 'Twenty'
    WHEN status = 30 THEN 'Thirty'
END as status, count(sname) as status_count

from suppliers
GROUP BY status
ORDER BY status;
