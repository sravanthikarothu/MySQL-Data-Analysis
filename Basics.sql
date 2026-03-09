-- Check version of MySQL
SELECT version();

/* Database - Physical Container that holds data & log files
   Schema - Logical container/Namespace within a database, used to group tables & manage permissions
   A single database can contain multiple schemas.
*/

-- Creating a Schema
-- Syntax : CREATE SCHEMA schema_name;
CREATE SCHEMA techcorp;

-- Delete Schema
-- Syntax : DROP SCHEMA schema_name
DROP DATABASE techcorp;

-- Verify the current database 
SELECT DATABASE();

-- View available databases
SHOW DATABASES;

-- To select a database
-- Syntax : USE schema_name;
USE techcorp;

/* Set default schema
   For the Current Query Session
   - Double-click the schema name. Its name will turn bold to indicate it is the current default. 
   
   For All Future Connections
   - On the MySQL Workbench home screen, find the connection you want to modify under MySQL Connections.
   - Right-click the connection tile and choose Edit Connection.
   - In the Edit Connection dialog, navigate to the Default Schema box.
   - Enter the name of the desired schema in the field.
   - Click Close or OK.
*/

-- View tables
SHOW TABLES;

-- view structure and constraints
-- Syntax : SHOW CREATE TABLE table_name;
SHOW CREATE TABLE employees;
-- OR
-- Syntax : DESCRIBE/DESC table_name;
DESC employees;









































































