-- Define database
CREATE DATABASE FP_NeoNest;

USE FP_NeoNest;

-- Define tables
CREATE TABLE customer (
    cst_id char(6) NOT NULL,
    cst_name varchar(100) NOT NULL,
    cst_phoneNumber varchar(20) NOT NULL,
    cst_address varchar(100) NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (cst_id)
);

CREATE TABLE employee (
    emp_id char(6) NOT NULL,
    emp_name varchar(100) NOT NULL,
    emp_phoneNumber varchar(20) NOT NULL,
    emp_address varchar(100) NOT NULL,
    emp_jobSection varchar(100) NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (emp_id)
);

CREATE TABLE item (
    item_id char(6) NOT NULL,
    item_name varchar(100) NOT NULL,
    item_price decimal(10, 2) NOT NULL,
    item_category varchar(50) NOT NULL,
    CONSTRAINT item_pk PRIMARY KEY (item_id)
);

CREATE TABLE membership (
    mbr_id char(6) NOT NULL,
    mbr_email varchar(100) NOT NULL,
    mbr_dateCreated date NOT NULL,
    mbr_dateExpired date NOT NULL,
    mbr_points int NOT NULL,
    customer_cst_id char(6) NOT NULL,
    CONSTRAINT membership_pk PRIMARY KEY (mbr_id)
);

CREATE TABLE transaction (
    tr_id char(6) NOT NULL,
    tr_totalBill decimal(10, 2) NOT NULL,
    tr_date date NOT NULL,
    tr_paymentMethod varchar(50) NOT NULL,
    customer_cst_id char(6) NOT NULL,
    employee_emp_id char(6) NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY (tr_id)
);

CREATE TABLE transaction_item (
    transaction_tr_id char(6) NOT NULL,
    item_item_id char(6) NOT NULL,
    item_amount int NOT NULL,
    CONSTRAINT transaction_item_pk PRIMARY KEY (
        transaction_tr_id,
        item_item_id
    )
);

ALTER TABLE membership ADD
    CONSTRAINT membership_customer FOREIGN KEY membership_customer (customer_cst_id) REFERENCES customer (cst_id);

ALTER TABLE transaction ADD
    CONSTRAINT transaction_customer FOREIGN KEY transaction_customer (customer_cst_id) REFERENCES customer (cst_id);

ALTER TABLE transaction ADD
    CONSTRAINT transaction_employee FOREIGN KEY transaction_employee (employee_emp_id) REFERENCES employee (emp_id);

ALTER TABLE transaction_item ADD
    CONSTRAINT transaction_item_item FOREIGN KEY transaction_item_item (item_item_id) REFERENCES item (item_id);

ALTER TABLE transaction_item ADD
    CONSTRAINT transaction_item_transaction FOREIGN KEY transaction_item_transaction (transaction_tr_id) REFERENCES transaction (tr_id);

-- Add Data
INSERT INTO customer 
VALUES 
    ('CST001', 'Rudi Santoso', '081234567890', 'Jl. Panglima Sudirman No. 1'),
    ('CST002', 'Siska Utami', '081234567891', 'Jl. Diponegoro No. 2'),
    ('CST003', 'Budi Prasetyo', '081234567892', 'Jl. A. Yani No. 3'),
    ('CST004', 'Dewi Wulandari', '081234567893', 'Jl. Veteran No. 4'),
    ('CST005', 'Farhan Ramadhan', '081234567894', 'Jl. Gajah Mada No. 5'),
    ('CST006', 'Sari Indah', '081234567895', 'Jl. Pahlawan No. 6'),
    ('CST007', 'Arief Hidayat', '081234567896', 'Jl. Basuki Rahmat No. 7'),
    ('CST008', 'Fitri Rahayu', '081234567897', 'Jl. Kartini No. 8'),
    ('CST009', 'Andi Setiawan', '081234567898', 'Jl. Trunojoyo No. 9'),
    ('CST010', 'Lina Fitriana', '081234567899', 'Jl. Raya No. 10'),
    ('CST011', 'Ajeng Susanti', '081234567890', 'Jl. Gatot Subroto No. 11'),
    ('CST012', 'Ivan Hermawan', '081234567891', 'Jl. Jenderal Sudirman No. 12'),
    ('CST013', 'Dini Pratiwi', '081234567892', 'Jl. Ahmad Yani No. 13'),
    ('CST014', 'Hendra Wijaya', '081234567893', 'Jl. Pattimura No. 14'),
    ('CST015', 'Anita Sari', '081234567894', 'Jl. Taman Sari No. 15'),
    ('CST016', 'Rizky Pratama', '081234567895', 'Jl. Kenari No. 16'),
    ('CST017', 'Nadia Fitri', '081234567896', 'Jl. Merdeka No. 17'),
    ('CST018', 'Arif Setiawan', '081234567897', 'Jl. Ahmad Dahlan No. 18'),
    ('CST019', 'Santika Rahmawati', '081234567898', 'Jl. Hayam Wuruk No. 19'),
    ('CST020', 'Firman Kurniawan', '081234567899', 'Jl. Suroyo No. 20'),
    ('CST021', 'Diva Sari', '081234567800', 'Jl. Diponegoro No. 21'),
    ('CST022', 'Dodi Nugroho', '081234567801', 'Jl. A. Yani No. 22'),
    ('CST023', 'Rina Anggraini', '081234567802', 'Jl. Gajah Mada No. 23'),
    ('CST024', 'Irfan Prasetyo', '081234567803', 'Jl. Gatot Subroto No. 24'),
    ('CST025', 'Lina Wulandari', '081234567804', 'Jl. Merdeka No. 25');


INSERT INTO employee 
VALUES 
    ('EMP001', 'Yuli Wijaya', '081234567800', 'Jl. Veteran No. 21', 'Sales'),
    ('EMP002', 'Ayu Sari', '081234567801', 'Jl. Diponegoro No. 22', 'Cashier'),
    ('EMP003', 'Dodi Nugroho', '081234567802', 'Jl. A. Yani No. 23', 'Warehouse'),
    ('EMP004', 'Sulis Anggraini', '081234567803', 'Jl. Gajah Mada No. 24', 'Sales'),
    ('EMP005', 'Irfan Prasetyo', '081234567804', 'Jl. Gatot Subroto No. 25', 'Cashier'),
    ('EMP006', 'Lina Wulandari', '081234567805', 'Jl. Merdeka No. 26', 'Warehouse'),
    ('EMP007', 'Eko Susanto', '081234567806', 'Jl. Trunojoyo No. 27', 'Sales'),
    ('EMP008', 'Sari Indah', '081234567807', 'Jl. Kartini No. 28', 'Cashier'),
    ('EMP009', 'Yoga Pratama', '081234567808', 'Jl. Pattimura No. 29', 'Warehouse'),
    ('EMP010', 'Dewi Fitriana', '081234567809', 'Jl. Suroyo No. 30', 'Cashier'),
    ('EMP011', 'Agus Budiawan', '081243562329', 'Jl. Budi Pekerti No. 23', 'Sales'),
    ('EMP012', 'Sentosa Adi', '081243285109', 'Jl. Kertajaya No. 37', 'Cashier');

INSERT INTO item 
VALUES 
    ('ITM001', 'Laptop', 16800000.00, 'Electronics'),
    ('ITM002', 'Smartphone', 11200000.00, 'Electronics'),
    ('ITM003', 'Mouse', 1200000.00, 'Electronics'),
    ('ITM004', 'Keyboard', 1500000.00, 'Electronics'),
    ('ITM005', 'Chair', 2500000.00, 'Furniture'),
    ('ITM006', 'Desk', 3000000.00, 'Furniture'),
    ('ITM007', 'Headset', 800000.00, 'Electronics'),
    ('ITM008', 'Monitor', 3500000.00, 'Electronics'),
    ('ITM009', 'Deskmate', 500000.00, 'Accessories'),
    ('ITM010', 'Mousepad', 200000.00, 'Accessories'),
    ('ITM011', 'Console', 12000000.00, 'Electronics'),
    ('ITM012', 'Controller', 800000.00, 'Electronics');

INSERT INTO membership 
VALUES 
    ('MBR001', 'rudi@gmail.com', '2023-01-01', '2023-12-31', 100, 'CST001'),
    ('MBR002', 'siska@gmail.com', '2023-02-01', '2023-12-31', 80, 'CST002'),
    ('MBR003', 'farhan@gmail.com', '2023-05-01', '2023-12-31', 90, 'CST005'),
    ('MBR004', 'arief@gmail.com', '2023-07-01', '2023-12-31', 130, 'CST007'),
    ('MBR005', 'andi@gmail.com', '2023-09-01', '2023-12-31', 85, 'CST009'),
    ('MBR006', 'lina@gmail.com', '2023-10-01', '2023-12-31', 95, 'CST010'),
    ('MBR007', 'ajeng@gmail.com', '2023-11-01', '2023-12-31', 110, 'CST011'),
    ('MBR008', 'ivan@gmail.com', '2023-12-01', '2023-12-31', 120, 'CST012'),
    ('MBR009', 'dini@gmail.com', '2023-06-01', '2023-12-31', 105, 'CST013'),
    ('MBR010', 'rizky@gmail.com', '2023-08-01', '2023-12-31', 125, 'CST016'),
    ('MBR011', 'arif@gmail.com', '2023-03-01', '2023-12-31', 115, 'CST018');

INSERT INTO transaction
VALUES
    ('TR001', 5000000.00, '2023-05-01', 'Credit Card', 'CST001', 'EMP005'),
    ('TR002', 12000000.00, '2023-04-02', 'Cash', 'CST002', 'EMP002'),
    ('TR003', 3500000.00, '2023-09-13', 'Debit Card', 'CST003', 'EMP008'),
    ('TR004', 4500000.00, '2023-02-04', 'Credit Card', 'CST004', 'EMP008'),
    ('TR005', 2500000.00, '2023-04-15', 'Cash', 'CST005', 'EMP002'),
    ('TR006', 3000000.00, '2023-10-06', 'Debit Card', 'CST006', 'EMP010'),
    ('TR007', 1000000.00, '2023-11-07', 'Credit Card', 'CST007', 'EMP012'),
    ('TR008', 3500000.00, '2023-02-08', 'Cash', 'CST008', 'EMP008'),
    ('TR009', 600000.00, '2023-07-09', 'Debit Card', 'CST009', 'EMP002'),
    ('TR010', 800000.00, '2023-02-10', 'Credit Card', 'CST010', 'EMP005'),
    ('TR011', 11200000.00, '2023-10-27', 'Cash', 'CST017', 'EMP002'),
    ('TR012', 1200000.00, '2023-08-08', 'Cash', 'CST008', 'EMP005'),
    ('TR013', 3000000.00, '2023-11-09', 'Debit Card', 'CST009', 'EMP012'),
    ('TR014', 7500000.00, '2023-07-14', 'Credit Card', 'CST010', 'EMP010'),
    ('TR015', 800000.00, '2023-08-19', 'Debit Card', 'CST009', 'EMP008'),
    ('TR016', 2500000.00, '2023-06-18', 'Credit Card', 'CST010', 'EMP012');

INSERT INTO transaction_item
VALUES
    ('TR001', 'ITM005', 2),
    ('TR002', 'ITM011', 1),
    ('TR003', 'ITM008', 1),
    ('TR004', 'ITM004', 3),
    ('TR005', 'ITM005', 1),
    ('TR006', 'ITM006', 1),
    ('TR007', 'ITM009', 2),
    ('TR008', 'ITM008', 1),
    ('TR009', 'ITM010', 3),
    ('TR010', 'ITM012', 1),
    ('TR011', 'ITM002', 1),
    ('TR012', 'ITM003', 1),
    ('TR013', 'ITM004', 2),
    ('TR014', 'ITM005', 3),
    ('TR015', 'ITM007', 1),
    ('TR016', 'ITM005', 1);
-- DDL
ALTER TABLE employee MODIFY COLUMN emp_jobSection VARCHAR(50);

ALTER TABLE employee ADD COLUMN emp_salary FLOAT(10, 2) NOT NULL;

ALTER TABLE membership
ADD
    CONSTRAINT membership_email_unique UNIQUE (mbr_email);

ALTER TABLE
    membership MODIFY COLUMN mbr_points FLOAT(10, 2) NOT NULL;

-- DML
UPDATE employee
SET emp_jobSection = Cashier
WHERE emp_name LIKE “%Agus%”;

UPDATE item SET item_price = 18000000.00 WHERE item_name = 'Laptop';

INSERT INTO
    item (
        item_name,
        item_price,
        item_category
    )
VALUES (
        'AirPods',
        2500000.00,
        'Electronics'
    );

UPDATE customer
SET
    cst_address = "Jl. Dieng No.11"
WHERE
    cst_name = "Budi Prasetyo";

-- Basic Query
SELECT customer.cst_name
FROM customer
    JOIN membership ON membership.customer_cst_id = customer.cst_id
WHERE
    membership.mbr_points > 100
    AND membership.mbr_points < 115;

SELECT
    employee.emp_name AS 'NameEmployee',
    transaction.tr_id AS 'TransactionID'
FROM transaction
    INNER JOIN employee ON transaction.employee_emp_id = employee.emp_id
WHERE
    employee.emp_name = 'Ayu Sari';

SELECT * FROM transaction WHERE tr_paymentMethod = 'Cash';

SELECT customer.*
FROM customer
    INNER JOIN membership ON membership.customer_cst_id = customer.cst_id
WHERE
    membership.mbr_dateCreated > "2023-07-16"; 
-- Basic Query


-- Agregate Query
SELECT *
FROM transaction
GROUP BY transaction.tr_id
HAVING
    AVG(transaction.tr_totalBill) > 5000000;

SELECT COUNT(customer.cst_id) AS 'TotalCustomer' FROM customer

SELECT SUM(mbr_points) AS total_points FROM membership;

SELECT
    customer.cst_name,
    customer.cst_phoneNumber,
    membership.mbr_email,
    COUNT(transaction.tr_id) AS totalTransaction
FROM customer
    INNER JOIN membership ON membership.customer_cst_id = customer.cst_id
    INNER JOIN transaction ON transaction.customer_cst_id = customer.cst_id
GROUP BY customer.cst_id
ORDER BY totalTransaction DESC
LIMIT 3 
-- Agregate Query

-- Nested Query
SELECT *
FROM (
        SELECT
            transaction.customer_cst_id AS CUST_ID,
            AVG(transaction.tr_totalBill) AS AVG_BILL
        FROM `transaction`
        GROUP BY
            transaction.customer_cst_id
    ) AS AVG_TAB
WHERE AVG_TAB.AVG_BILL > (
        SELECT
            AVG(transaction.tr_totalBill)
        FROM transaction
    )
ORDER BY AVG_TAB.AVG_BILL DESC;

SELECT c.cst_id, c.cst_name, t.tr_totalBill
FROM customer c
JOIN transaction t ON t.customer_cst_id = c.cst_id
WHERE cst_id IN (
    SELECT 
        customer_cst_id
    FROM 
        transaction t
    GROUP BY 
        customer_cst_id
    HAVING 
        SUM(t.tr_totalBill) > (SELECT AVG(tr_totalBill) FROM transaction)
);



SELECT
    employee.*,
    COUNT(transaction.tr_id) AS totalTransaction
FROM employee
    INNER JOIN transaction ON transaction.employee_emp_id = employee.emp_id
GROUP BY employee.emp_id
HAVING totalTransaction = 
        (
        SELECT
            MAX(totalTransaction)
        FROM (
                SELECT
                    *,
                    COUNT(transaction.tr_id) AS totalTransaction
                FROM employee
                    INNER JOIN transaction ON transaction.employee_emp_id = employee.emp_id
                GROUP BY
                    employee.emp_id
            ) AS subQuery
        )
-- Nested Query