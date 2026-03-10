-- TCL : Transaction Control Language
/* 1. COMMIT - saves all the changes made in the current transaction permanently.
Syntax : COMMIT;
*/
Update employees
Set email = 'siya.singhania'
WHERE emp_id = 5;
COMMIT;



/* 2. ROLLBACK - Undo the changes made in the current transaction before COMMIT.
Syntax : ROLLBACK;
*/
Update employees
Set first_name = 'Abhimanyu'
WHERE emp_id = 2;
ROLLBACK;



/* 3. SAVEPOINT - Creates a checkpoint inside a transaction. 
Partial Rollbacks. 
We can Rollback only upto savepoint, not the entire transaction.
Syntax : SAVEPOINT savepoint_name;
*/
START transaction;
UPDATE employees
SET first_name = 'Amaaya', last_name = 'Mittal', email = 'amaaya.mittal@gmail.com'
WHERE emp_id = 2;
SAVEPOINT after_first_update;

UPDATE employees
SET first_name = 'Ruthvik', last_name = 'Rajvansh', email = 'ruthvik.rajvansh@gmail.com'
WHERE emp_id = 3;

ROLLBACK to after_first_update;
COMMIT;

