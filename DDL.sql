-- DDL : Data Definition Language
/* 1. CREATE - creates a table/database
 Syntax : CREATE TABLE table_name(
 				column1 datatype [Constraints], 	[] -> Optional
 				column2 datatype [Constraints],
 				-----------
				columnN datatype [Constraints]
	       ); 
*/
USE techcorp;
CREATE TABLE departments(
	dept_id INT AUTO_INCREMENT PRIMARY KEY,        -- Auto increment allows unique numbers to be generated automatically when a new record is inserted.
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

/* Creating Foreign Key
   Syntax : CREATE TABLE table_name(
 				column1 datatype [constraints],
 				column2 datatype [constraints],
 				foreign_key_column datatype [constraints],
 				-----------
				columnN datatype [constraints],				
 				CONSTRAINT constraint_name
 					FOREIGN KEY(foreign_key_column)
 					REFERENCES parent_table(parent_column)
 			);

CASCADE - used in a foreign key constraint to automatically syncs a change (delete or update) from a "parent" table to related "child" tables.
  1. ON DELETE CASCADE   - When a row in the parent table is deleted, all corresponding rows in the child table that reference it are automatically deleted. 
  2. ON UPDATE CASCADE   - If the primary key value in the parent table updated, it automatically updates foreign key value in the child table.
  3. ON DELETE SET NULL  - Sets the child table's foreign key to NULL when the parent row is deleted.
  4. ON DELETE RESTRICT  - Prevents the parent row from being modified if related child rows exist.
  5. ON DELETE NO ACTION - NO ACTION behaves exactly the same as RESTRICT 
*/ 
CREATE TABLE employees(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK(salary >= 0),
    hire_date DATE NOT NULL,
    dept_id INT,
    CONSTRAINT fk_dept
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);

CREATE TABLE projects(
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(80) NOT NULL UNIQUE,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2)
);

-- Composite Primary Key - uses two or more table columns together to uniquely identify each row.
-- Composite Foreign Key - consists of two or more columns which together reference the composite primary key in another table.
CREATE TABLE employee_projetcs(
	emp_id INT,
    project_id INT,
    allocated_hours INT DEFAULT 0 CHECK(allocated_hours >= 0),
    PRIMARY KEY(emp_id,project_id), 					-- Composite Primary Key
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
    ON DELETE CASCADE,
    
    FOREIGN KEY(project_id) REFERENCES projects(project_id)
    ON DELETE CASCADE
);
   
-- DEFAULT - used to assign a default value to a column when no value is provided during INSERT.
-- Syntax : column_name datatype DEFAULT value
CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
    
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) CHECK(total_amount >= 0),
    
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE
);	

CREATE TABLE order_items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100) NOT NULL,
    quantity INT CHECK(quantity > 0),
    price DECIMAL(10,2) CHECK(price >= 0),
    
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE
);
      
	
    
/* 2. ALTER - modifies structure of existing table or database
a. Add a Column
Syntax : ALTER TABlE table_name
		 ADD column_name datatype;
*/ 
ALTER TABLE employees
ADD manager varchar(100);

/* b. Drop Column
Syntax : ALTER TABLE table_name
		 DROP COLUMN column_name;
*/
ALTER TABLE employees
DROP COLUMN manager;

/* c. Modify Column(Change datatype/size)
Syntax : ALTER TABLE table_name
		 MODIFY column_name new_datatype;
*/
ALTER TABLE employees
MODIFY email varchar(80);

/* d. Rename Column/Change Datatype
Syntax : ALTER TABLE table_name
		 CHANGE old_column_name new_column_name datatype;
*/
ALTER TABLE customers
CHANGE full_name name varchar(80);

/* e. Rename Column
Syntax : ALTER TABLE table_name
		 RENAME COLUMN old_name to new_name;
*/
ALTER TABLE customers
RENAME COLUMN name to full_name;

/* f. Rename Table
Syntax : ALTER TABLE old_table_name
		 RENAME to new_table_name;
*/
ALTER TABLE employee_projetcs
RENAME to projects;

/* g. Add Constaint
Syntax : ALTER TABLE table_name
		 ADD CONSTRAINT constraint_name constraint_type(column_name(s));
*/
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE(email);

ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY(dept_id) references departments(dept_id);

/* h. Drop Constaint
Syntax : ALTER TABLE table_name
		 DROP CONSTRAINT constraint_name;
*/
-- PRIMARY KEY
ALTER TABLE employees
DROP PRIMARY KEY;

-- UNIQUE
ALTER TABLE employees
DROP INDEX unique_email;

-- FOREIGN KEY
ALTER TABLE employees
DROP FOREIGN KEY fk_dept;

ALTER TABLE employees
DROP CHECK check_constraint;



/* 3. DROP - Permanently deletes the table
Syntax : DROP TABLE table_name;
*/
DROP TABLE orders;



/* 4. TRUNCATE - deletes all the data from table rows while keeping table structure.
Syntax : TRUNCATE TABLE table_name;
*/
TRUNCATE TABLE employee_projects;

/* 5. RENAME - Changes the name of a table
Syntax : RENAME TABLE old_table_name TO new_table_name;
*/
RENAME TABLE orders TO monthly_orders, sales TO monthly_sales;


/* COLUMN_LEVEL constraints - Appear in INFORMATION_SCHEMA.COLUMNS
   They belong to individual columns.
	-> NOT NULL
    -> DEFAULT
    -> CHECK
    -> PRIMARY KEY
    -> UNIQUE
    
   TABLE_LEVEL constraints - Appear in INFORMATION_SCHEMA.TABLE_CONSTRAINTS
									   INFORMATION_SCHEMA.KEY_COLUMN_USAGE
   They apply to the table structure, not only a column.
	-> FOREIGN KEY
    -> CHECK
    -> PRIMARY KEY (multiple columns)
    -> UNIQUE (multiple columns)
*/


-- To determine NOT NULL constraint in table
/* Syntax : SELECT column_name, IS_NULLABLE
			FROM INFORMATION_SCHEMA.COLUMNS
            WHERE table_schema = 'your_schema_name' AND
				  table_name = 'your_table_name';
*/
SELECT column_name, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'techcorp' AND
	  table_name = 'projects';



-- To determine DEFAULT constraint in table 
/* Syntax : SELECT column_name, column_default
			FROM INFORMATION_SCHEMA.COLUMNS
            WHERE table_schema = 'your_schema_name' AND
				  table_name = 'your_table_name' AND
                  column_name = 'your_column_name';
*/
SELECT column_name, column_default
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'techcorp' AND
	  table_name = 'employees' AND
      column_name = 'salary';



-- To determine CHECK constraint in table 
/* Syntax : SELECT constraint_name, constraint_type
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
            WHERE table_schema = 'your_schema_name' AND
				  table_name = 'your_table_name' AND
                  constraint_type = 'CHECK';
*/
SELECT constraint_name, constraint_type
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE table_schema = 'techcorp' AND
	  table_name = 'orders' AND
	  constraint_type = 'CHECK';
      
      
      
-- To determine if a column/table has constraints(Primary key,unique,foreign key)
/* Syntax : SELECT constraint_name, constraint_type
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
            WHERE table_schema = 'your_schema_name' AND
				  table_name = 'your_table_name' AND
                  constraint_name IN ( SELECT constraint_name
									   FROM information_schema.KEY_COLUMN_USAGE
                                       WHERE table_schema = 'your_schema_name' AND
											 table_name = 'your_table_name' AND
                                             column_name = 'your_column_name'
									 );
*/
SELECT constraint_name, constraint_type
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE table_schema = 'techcorp' AND
	  table_name = 'employees' AND
	  constraint_name IN ( SELECT constraint_name
						   FROM information_schema.KEY_COLUMN_USAGE
						   WHERE table_schema = 'techcorp' AND
								 table_name = 'employees' AND
								 column_name = 'dept_id'
						  );



-- To determine if a table has FOREIGN KEY
/* Syntax : SELECT constraint_name, column_name, referenced_table_name, referenced_column_name
			FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
            WHERE referenced_table_schema = 'database_name' AND
				  table-name = 'table_name' AND
                  referenced_table_name IS NOT NULL;
*/
SELECT constraint_name, column_name, referenced_table_name, referenced_column_name
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE referenced_table_schema = 'techcorp' AND
	  table_name = 'order_items' AND
      referenced_table_name IS NOT NULL;
      
      

DESCRIBE employees;
SHOW CREATE TABLE employees;






