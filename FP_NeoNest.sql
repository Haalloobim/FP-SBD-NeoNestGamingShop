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
