-- DML : Data Manipulation Language
/* 1. INSERT - adds the records into the table
-> Single Row 
Syntax : INSERT INTO table_name (column1, column2, column3, ...)
		 VALUES (value1, value2, value3, ...);
-> Multiple Rows
Syntax : INSERT INTO table_name (column1, column2, column3, ...)
		 VALUES
			(value1_row1, value2_row1, value3_row1, ...),
			(value1_row2, value2_row2, value3_row2, ...),
			(value1_row3, value2_row3, value3_row3, ...);
            ------------
*/
INSERT INTO departments (dept_name, location) VALUES
('HR', 'Hyderabad'),
('IT', 'Bangalore'),
('Finance', 'Mumbai'),
('Sales', 'Delhi'),
('Operations', 'Chennai');

INSERT INTO employees 
(first_name, last_name, email, salary, hire_date, dept_id) VALUES
('Ravi', 'Kumar', 'ravi.kumar@gmail.com', 45000, '2021-06-15', 2),
('Anita', 'Sharma', 'anita.sharma@gmail.com', 55000, '2020-03-20', 1),
('Suresh', 'Reddy', 'suresh.reddy@gmail.com', 60000, '2019-11-10', 2),
('Neha', 'Verma', 'neha.verma@gmail.com', 48000, '2022-01-05', 3),
('Amit', 'Singh', 'amit.singh@gmail.com', 70000, '2018-09-12', 4),
('Priya', 'Nair', 'priya.nair@gmail.com', 52000, '2021-08-25', 5),
('Kiran', 'Patel', 'kiran.patel@gmail.com', 65000, '2020-12-01', 2),
('Sunita', 'Joshi', 'sunita.joshi@gmail.com', 43000, '2022-07-18', 1);

INSERT INTO projects 
(project_name, start_date, end_date, budget) VALUES
('Payroll System', '2023-01-01', '2023-06-30', 500000),
('E-commerce App', '2023-03-15', '2023-12-31', 1200000),
('CRM Tool', '2022-10-01', '2023-04-30', 750000),
('Mobile Banking', '2023-02-01', NULL, 2000000),
('Sales Dashboard', '2023-05-01', '2023-08-31', 300000);

INSERT INTO employee_projects 
(emp_id, project_id, allocated_hours) VALUES
(1, 2, 120),
(1, 5, 60),
(2, 1, 100),
(3, 2, 150),
(3, 4, 200),
(4, 3, 90),
(5, 5, 110),
(6, 3, 80),
(7, 4, 160),
(8, 1, 70);

INSERT INTO customers 
(full_name, phone, email) VALUES
('Rahul Mehta', '9876543210', 'rahul.mehta@gmail.com'),
('Sneha Iyer', '9123456789', 'sneha.iyer@gmail.com'),
('Vikas Malhotra', '9988776655', 'vikas.m@gmail.com'),
('Pooja Desai', '9090909090', 'pooja.desai@gmail.com'),
('Arjun Rao', '9345678901', 'arjun.rao@gmail.com');

INSERT INTO orders 
(customer_id, order_date, total_amount) VALUES
(1, '2023-06-10 10:30:00', 2500),
(2, '2023-06-12 14:45:00', 4200),
(3, '2023-06-15 09:20:00', 1800),
(1, '2023-06-18 16:10:00', 3200),
(4, '2023-06-20 11:00:00', 5000),
(5, '2023-06-22 18:40:00', 2700);

INSERT INTO order_items 
(order_id, product_name, quantity, price) VALUES
(1, 'Keyboard', 1, 1500),
(1, 'Mouse', 1, 1000),
(2, 'Headphones', 2, 2100),
(3, 'USB Cable', 3, 600),
(4, 'Laptop Bag', 1, 3200),
(5, 'Monitor', 1, 5000),
(6, 'Power Bank', 1, 2700);



/* 2. UPDATE - update existing row/record
Syntax : UPDATE table_name
		 SET column1 = value1, column2 = value2,------
         [WHERE CONDITION]
*/ 
UPDATE employees
SET first_name = 'Abhimaan', last_name = 'Rajput', email = 'abhimaan.rajput@gmail.com'
WHERE emp_id = 1;



/* 3. DELETE - deletes a particular row/record
Syntax : DELETE FROM table_name
		 [WHERE condition];
Without WHERE, deletes all rows
*/
DELETE FROM employees
WHERE first_name = 'Neha';

