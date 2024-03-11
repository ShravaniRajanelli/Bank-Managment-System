# Creating a Bank Management System
 create database Bank_Management_System;
 
 
 use Bank_Management_System;
 
 CREATE TABLE customer
   (
       customer_id VARCHAR(6),
       first_name VARCHAR(30),
       middle_name VARCHAR(30),
       last_name VARCHAR(30),
       city VARCHAR(15),
       mobile_no VARCHAR(10),
       occupation VARCHAR(10),
       date_of_birth DATE,
      CONSTRAINT customer_custid_pk PRIMARY KEY(customer_id)   
   );
   
   
INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06'),
                           ('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16'),
						   ('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26'),
                           ('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03'),
                           ('C00005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19'),
                           ('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06'),
                           ('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06'),
                           ('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03'),
						   ('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22'),
                           ('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');
   
   desc customer;
   select * from customer;
 
   
   
   
   CREATE TABLE branch
   (
    branch_id VARCHAR(6),
    branch_name VARCHAR(30),
    branch_city VARCHAR(30),
    CONSTRAINT branch_bid_pk PRIMARY KEY(branch_id) 
   );
   
   
INSERT INTO branch VALUES('B00001','Asaf ali road','Delhi'),
						 ('B00002','New delhi main branch','Delhi'),
						 ('B00003','Delhi cantt','Delhi'),
                         ('B00004','Jasola','Delhi'),
                         ('B00005','Mahim','Mumbai'),
                         ('B00006','Vile parle','Mumbai'),
                         ('B00007','Mandvi','Mumbai'),
                         ('B00008','Jadavpur','Kolkata'),
                         ('B00009','Kodambakkam','Chennai');
   
   desc branch;
   select * from branch;
   
   
   
   CREATE TABLE account
   (
      account_number VARCHAR(6),
      customer_id  VARCHAR(6),
      branch_id VARCHAR(6),
      opening_balance INT(7),
      account_open_date DATE,
      account_type VARCHAR(10),
      account_status VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(account_number),
      CONSTRAINT account_custid_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
      CONSTRAINT account_bid_fk FOREIGN KEY(branch_id) REFERENCES branch(branch_id) 
    );
   
INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active'),
                          ('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active'),
						  ('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active'),
						  ('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active'),
						  ('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active'),
						  ('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended'),
						  ('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active'),
                          ('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated'),
						  ('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated'),
                          ('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');
   
   desc account;
   select * from account;
   
   CREATE TABLE transaction_details
    (   
     transaction_number VARCHAR(6),
     account_number VARCHAR(6),
     date_of_transaction DATE,
     medium_of_transaction VARCHAR(20),
     transaction_type VARCHAR(20),
     transaction_amount INT(7),    
     CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(transaction_number),
     CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_number) REFERENCES account(account_number)  
    );
    
INSERT INTO transaction_details VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000),
                              ('T00002','A00001','2013-02-01','Cash','Withdrawal',1000),
                              ('T00003','A00002','2013-01-01','Cash','Deposit',2000),
							  ('T00004','A00002','2013-02-01','Cash','Deposit',3000),
                              ('T00005','A00007','2013-01-11','Cash','Deposit',7000),
                              ('T00006','A00007','2013-01-13','Cash','Deposit',9000),
							  ('T00007','A00001','2013-03-13','Cash','Deposit',4000),
                              ('T00008','A00001','2013-03-14','Cheque','Deposit',3000),
                              ('T00009','A00001','2013-03-21','Cash','Withdrawal',9000),
							  ('T00010','A00001','2013-03-22','Cash','Withdrawal',2000),
                              ('T00011','A00002','2013-03-25','Cash','Withdrawal',7000),
							  ('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);
    
    
    desc transaction_details;
    select * from transaction_details;
    
    
    CREATE TABLE loan
   (
    customer_id VARCHAR(6),
    branch_id VARCHAR(6),
    loan_amount INT(7),
    CONSTRAINT loan_customer_custid_bid_pk PRIMARY KEY(customer_id,branch_id),
    CONSTRAINT loan_custid_fk FOREIGN KEY(customer_id) REFERENCES  customer(customer_id),
    CONSTRAINT loan_bid_fk FOREIGN KEY(branch_id) REFERENCES  branch(branch_id)
   );
   
   
INSERT INTO loan VALUES('C00001','B00001',100000),
                       ('C00002','B00002',200000),
					   ('C00009','B00008',400000),
                       ('C00010','B00009',500000),
					   ('C00001','B00003',600000),
					   ('C00002','B00001',600000);
                       
	desc loan;
    select * from loan;
    
    
    # 1) Write a query to display the customer number, firstname, customer’s date of birth.
    #    Display in sorted order of date of birth year and within that sort by firstname.
             
             select first_name,mobile_no,date_of_birth from customer
             order by EXTRACT(year from date_of_birth),first_name;
             
    
    
         
    # 2) Write a query to display the customer’s number, first name, and middle name. 
    #    The customer’s who don’t have a middle name, for them display the last name. 
    #    Give the alias name as Cust_Name.
    
           select mobile_no,first_name,if(middle_name is Not Null,middle_name,last_name) as cust_name from customer;
    
    # 3) Write a query to display account number, customer’s number, customer’s firstname,
    #    lastname,account opening date.
    
           select a.account_number,c.mobile_no,c.first_name,c.last_name,a.account_open_date from account as a
           inner join customer as c
           on a.customer_id=c.customer_id;
    
    # 4) Write a query to display the number of customer’s from Delhi. 
    #    Give the count an alias name of Cust_Count.
    
          select count(customer_id) as cust_count , city from customer
          where city="Delhi";
    
    # 5) Write a query to display  the customer number, customer firstname,account number for 
    #    the customer’s whose accounts were created after 15th of any month.
    
             select c.mobile_no,c.first_name,a.account_number from account as a
             inner join customer as c
             on a.customer_id = c.customer_id
             where day(account_open_date) > 15;
    
    # 6) Write a query to display the customers firstname, city and account number who 
    #    are not into business, service or studies.
    
              select c.first_name,c.city,a.account_number,c.occupation from customer as c
              inner join account as a
              where c.occupation not in ("business","service","student");
    
    # 7) Write a query to display city name and count of branches in that city. Give the count
    #    of branches an alias name of Count_Branch.
    
         select branch_city,count(branch_id) as count_branch from branch
          group by branch_city;
        
    # 8) Write a query to display account id, customer’s firstname, customer’s lastname for the
    #    customer’s whose account is Active.
    
           select a.account_number,c.first_name,c.last_name,a.account_status from customer as c
           inner join account as a
           on c.customer_id = a.customer_id
           where a.account_status = "Active";
           
    
    # 9) Write a query to display the customer’s number, customer’s firstname, branch id and loan
    #    amount for people who have taken loans.
    
            select c.first_name,c.mobile_no,b.branch_id,l.loan_amount from loan as l
            inner join customer as c
            on l.customer_id = c.customer_id
            inner join branch as b
            on l.branch_id = b.branch_id;
	
    
    # 10) Write a query to display customer number, customer name, account number where the account 
    #     status is terminated.
    
          select c.mobile_no,concat(c.first_name,c.last_name) as customer_name,a.account_number,a.account_status from customer as c
           inner join account as a
           on c.customer_id = a.customer_id
           where a.account_status = "terminated";