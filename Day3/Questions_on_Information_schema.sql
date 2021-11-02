-- 1. Identify and query the data dictionaries which can provide following details
-- 		List of tables in scott schema
-- 		List of columns and correspondings data types of all the tables in scott schema
USE information_schema;

SELECT *
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'scott';

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'scott';

-- 2. Fetch list of all data dictionary in information schema and observe there naming convention

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'information_schema';

-- 3. List all data dictionary whose name have 'col' keyword in it.

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'information_schema'
AND TABLE_NAME LIKE '%COL%';