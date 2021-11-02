/*
Customer table
1. Customer id in customer table must be unique and does not allow null values
2. Column fname must not allow space in it
3. First name, middle name and last name must not be same
4. Age of customer (based on date of birth) must be more then 10 years old.
*/


-- 1. Customer id in customer table must be unique and does not allow null values
ALTER TABLE customer MODIFY custid VARCHAR(6) NOT NULL;
ALTER TABLE customer ADD CONSTRAINT UK_custid UNIQUE(custid);        

-- 2. Column fname must not allow space in it    
ALTER TABLE customer ADD CONSTRAINT fname_noSpace CHECK(fname NOT LIKE '% %');
