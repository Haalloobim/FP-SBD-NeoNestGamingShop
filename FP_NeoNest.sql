CREATE DATABASE FP_NeoNest;

USE DATABASE FP_NeoNest;

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

