-- Define database
CREATE DATABASE FP_NeoNest;
USE DATABASE FP_NeoNest;

-- Define tables
CREATE TABLE customer (
    cst_id char(6)  NOT NULL,
    cst_name varchar(100)  NOT NULL,
    cst_phoneNumber varchar(20)  NOT NULL,
    cst_address varchar(100)  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (cst_id)
);

CREATE TABLE employee (
    emp_id char(6)  NOT NULL,
    emp_name varchar(100)  NOT NULL,
    emp_phoneNumber varchar(20)  NOT NULL,
    emp_address varchar(100)  NOT NULL,
    emp_jobSection varchar(100)  NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (emp_id)
);

CREATE TABLE item (
    item_id char(6)  NOT NULL,
    item_name varchar(100)  NOT NULL,
    item_price decimal(10,2)  NOT NULL,
    item_category varchar(50)  NOT NULL,
    CONSTRAINT item_pk PRIMARY KEY (item_id)
);

CREATE TABLE membership (
    mbr_id char(6)  NOT NULL,
    mbr_email varchar(100)  NOT NULL,
    mbr_dateCreated date  NOT NULL,
    mbr_dateExpired date  NOT NULL,
    mbr_points int  NOT NULL,
    customer_cst_id char(6)  NOT NULL,
    CONSTRAINT membership_pk PRIMARY KEY (mbr_id)
);

CREATE TABLE transaction (
    tr_id char(6)  NOT NULL,
    tr_totalBill decimal(10,2)  NOT NULL,
    tr_date date  NOT NULL,
    tr_paymentMethod varchar(50)  NOT NULL,
    customer_cst_id char(6)  NOT NULL,
    employee_emp_id char(6)  NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY (tr_id)
);

CREATE TABLE transaction_item (
    transaction_tr_id char(6)  NOT NULL,
    item_item_id char(6)  NOT NULL,
    item_amount int  NOT NULL,
    CONSTRAINT transaction_item_pk PRIMARY KEY (transaction_tr_id,item_item_id)
);

ALTER TABLE membership ADD CONSTRAINT membership_customer FOREIGN KEY membership_customer (customer_cst_id)
    REFERENCES customer (cst_id);

ALTER TABLE transaction ADD CONSTRAINT transaction_customer FOREIGN KEY transaction_customer (customer_cst_id)
    REFERENCES customer (cst_id);

ALTER TABLE transaction ADD CONSTRAINT transaction_employee FOREIGN KEY transaction_employee (employee_emp_id)
    REFERENCES employee (emp_id);

ALTER TABLE transaction_item ADD CONSTRAINT transaction_item_item FOREIGN KEY transaction_item_item (item_item_id)
    REFERENCES item (item_id);

ALTER TABLE transaction_item ADD CONSTRAINT transaction_item_transaction FOREIGN KEY transaction_item_transaction (transaction_tr_id)
    REFERENCES transaction (tr_id);

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
    ('CST011', 'Rina Susanti', '081234567890', 'Jl. Gatot Subroto No. 11'),
    ('CST012', 'Ivan Hermawan', '081234567891', 'Jl. Jenderal Sudirman No. 12'),
    ('CST013', 'Dini Pratiwi', '081234567892', 'Jl. Ahmad Yani No. 13'),
    ('CST014', 'Hendra Wijaya', '081234567893', 'Jl. Pattimura No. 14'),
    ('CST015', 'Anita Sari', '081234567894', 'Jl. Taman Sari No. 15'),
    ('CST016', 'Rizky Pratama', '081234567895', 'Jl. Kenari No. 16'),
    ('CST017', 'Nadia Fitri', '081234567896', 'Jl. Merdeka No. 17'),
    ('CST018', 'Arif Setiawan', '081234567897', 'Jl. Ahmad Dahlan No. 18'),
    ('CST019', 'Dewi Rahmawati', '081234567898', 'Jl. Hayam Wuruk No. 19'),
    ('CST020', 'Firman Kurniawan', '081234567899', 'Jl. Suroyo No. 20');

INSERT INTO employee 
VALUES 
    ('EMP001', 'Yuli Wijaya', '081234567800', 'Jl. Veteran No. 21', 'Sales'),
    ('EMP002', 'Rina Sari', '081234567801', 'Jl. Diponegoro No. 22', 'Cashier'),
    ('EMP003', 'Dodi Nugroho', '081234567802', 'Jl. A. Yani No. 23', 'Warehouse'),
    ('EMP004', 'Rina Anggraini', '081234567803', 'Jl. Gajah Mada No. 24', 'Sales'),
    ('EMP005', 'Irfan Prasetyo', '081234567804', 'Jl. Gatot Subroto No. 25', 'Cashier'),
    ('EMP006', 'Lina Wulandari', '081234567805', 'Jl. Merdeka No. 26', 'Warehouse'),
    ('EMP007', 'Eko Susanto', '081234567806', 'Jl. Trunojoyo No. 27', 'Sales'),
    ('EMP008', 'Sari Indah', '081234567807', 'Jl. Kartini No. 28', 'Cashier'),
    ('EMP009', 'Yoga Pratama', '081234567808', 'Jl. Pattimura No. 29', 'Warehouse'),
    ('EMP010', 'Dewi Fitriana', '081234567809', 'Jl. Suroyo No. 30', 'Sales');

INSERT INTO item 
VALUES 
    ('ITEM001', 'Laptop', 16800000.00, 'Electronics'),
    ('ITEM002', 'Smartphone', 11200000.00, 'Electronics'),
    ('ITEM003', 'Coffee Maker', 700000.00, 'Appliances'),
    ('ITEM004', 'Toaster', 420000.00, 'Appliances'),
    ('ITEM005', 'Chair', 700000.00, 'Furniture'),
    ('ITEM006', 'Desk', 1400000.00, 'Furniture'),
    ('ITEM007', 'T-shirt', 210000.00, 'Clothing'),
    ('ITEM008', 'Jeans', 560000.00, 'Clothing'),
    ('ITEM009', 'Running Shoes', 840000.00, 'Footwear'),
    ('ITEM010', 'Backpack', 350000.00, 'Accessories');

INSERT INTO membership 
VALUES 
    ('MBR001', 'rudi@email.com', '2023-01-01', '2023-12-31', 100, 'CST001'),
    ('MBR002', 'siska@email.com', '2023-02-01', '2023-12-31', 80, 'CST002'),
    ('MBR003', 'budi@email.com', '2023-03-01', '2023-12-31', 120, 'CST003'),
    ('MBR004', 'dewi@email.com', '2023-04-01', '2023-12-31', 150, 'CST004'),
    ('MBR005', 'farhan@email.com', '2023-05-01', '2023-12-31', 90, 'CST005'),
    ('MBR006', 'sari@email.com', '2023-06-01', '2023-12-31', 110, 'CST006'),
    ('MBR007', 'arief@email.com', '2023-07-01', '2023-12-31', 130, 'CST007'),
    ('MBR008', 'fitri@email.com', '2023-08-01', '2023-12-31', 75, 'CST008'),
    ('MBR009', 'andi@email.com', '2023-09-01', '2023-12-31', 85, 'CST009'),
    ('MBR010', 'lina@email.com', '2023-10-01', '2023-12-31', 95, 'CST010');

INSERT INTO transaction 
VALUES 
    ('TR001', 300.00, '2023-01-15', 'Credit Card', 'CST001', 'EMP001'),
    ('TR002', 150.00, '2023-02-20', 'Cash', 'CST002', 'EMP002'),
    ('TR003', 200.00, '2023-03-25', 'Debit Card', 'CST003', 'EMP003'),
    ('TR004', 80.00, '2023-04-10', 'Cash', 'CST004', 'EMP004'),
    ('TR005', 120.00, '2023-05-05', 'Credit Card', 'CST005', 'EMP005'),
    ('TR006', 90.00, '2023-06-12', 'Cash', 'CST006', 'EMP006'),
    ('TR007', 110.00, '2023-07-18', 'Debit Card', 'CST007', 'EMP007'),
    ('TR008', 70.00, '2023-08-22', 'Cash', 'CST008', 'EMP008'),
    ('TR009', 100.00, '2023-09-30', 'Credit Card', 'CST009', 'EMP009'),
    ('TR010', 50.00, '2023-10-15', 'Cash', 'CST010', 'EMP010');

INSERT INTO transaction_item 
VALUES 
    ('TR001', 'ITEM001', 2),
    ('TR002', 'ITEM003', 1),
    ('TR003', 'ITEM005', 3),
    ('TR004', 'ITEM007', 1),
    ('TR005', 'ITEM009', 2),
    ('TR006', 'ITEM002', 1),
    ('TR007', 'ITEM006', 2),
    ('TR008', 'ITEM008', 1),
    ('TR009', 'ITEM004', 2),
    ('TR010', 'ITEM010', 3);
