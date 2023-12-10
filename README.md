# Database System - Final Project [ NeoNest Gaming Shop ]

## Description
We were tasked with creating a case study for a gaming shop business. In this project, we developed a database system, 
covering everything from DDL and DML to providing examples of data retrieval through queries. Explore our Gaming Shop case study repository 
for an in-depth look into the database implementation and query samples.

## Bussiness Study Case 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NeoNest, a new gaming store, is in need of a comprehensive database system to streamline its operations and effectively manage transactions. The database should capture information about **employees**, **customers**, **items**, **purchase transactions, and membership**.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NeoNest is staffed with several employees, each assigned to different sections based on the store's requirements. To facilitate **employee** management, the store owner will input employee data into the database, including details such as name, telephone number, address, and job section (e.g., sales associate, cashier, cleaning service, etc.). 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the purchase **transactions**, the system will record the transaction date, employee id, customer id, total price, and payment method. Employees will also input NeoNest **customer** data such as name, telephone number, and address into the database.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Every gaming **item** sold will be updated by the employee in the database, encompassing details like item name, item price, and category. The Store also has a **membership** system that gives some advantage to the customer. The data that will be recorded to the database are email, date created, date expired, and membership points.

## Assumption 
- Each customer can have a membership, but it is not mandatory that customers should have membership. And also each membership should be owned by one customer.  
- Each employee has only one job section and one phone number.
- Every transaction in the Gaming House will be stored in a different entity called transaction.	
- NeoNest Gaming Store uses	 a 6-digit ID for each table. Example for transaction entities TR0001, TR0002, TR0003
- Not all employee have to handle transaction because maybe they have the different job section
