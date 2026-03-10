-- DCL : Data Control Language
-- DCL commands require admin rights.
/* 1. GRANT - Used to give permission to the other users to access the database objects.
Syntax : GRANT privilege_list
		 ON object_name
         TO username;
*/
GRANT SELECT
ON employees
TO 'john'@'localhost';
-- John can only read data from employees.

GRANT SELECT, UPDATE
ON orders
TO 'emma'@'localhost';
-- Emma can read & update orders, 

GRANT ALL PRIVILEGES
ON techcorp.*
TO 'admin_user'@'localhost';
-- Admin_User gets full access to all the tables in techcorp.

/* 2. REVOKE - Take back/remove the given permission.
Syntax : REVOKE privilege_list
		 ON object_name
         FROM user_name;
*/
REVOKE SELECT
ON employees
FROM 'john'@'localhost';
-- John can no longer read the data from employees.

REVOKE ALL PRIVILEGES
ON techcorp.*
FROM 'admin_user'@'localhost';
-- Removes everything from the user on that database.



