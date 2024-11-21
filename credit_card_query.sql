
-- 1. CREATE A DATABASE-
CREATE DATABASE CREDIT_CARD;

-- 2. CREATE  CREDIT_CARD_DETAILS TABLE-
CREATE TABLE CREDIT_CARD_DETAILS (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 3. CREATE CUSTOMER DETAILS TABLE-
CREATE TABLE CUST_DETAILS (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 4. INSERT DATA INTO CREDIT_CARD_DETAILS-
SET SQL_SAFE_UPDATES = 0;

LOAD DATA INFILE 'D:/DATA ANALYTICS/POWER_BI/PROJECT/CREDIT CARD DASHBOARD/credit_card.csv'
INTO TABLE CREDIT_CARD_DETAILS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Optional: ignores the header row if present

-- 5. INSERT DATA INTO Cust_DETAILS-
LOAD DATA INFILE 'D:/DATA ANALYTICS/POWER_BI/PROJECT/CREDIT CARD DASHBOARD/customer.csv'
INTO TABLE  CUST_DETAILS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for 
the right syntax to use near '-' at line 1 */


-- 6. ADD DATA AFTER THE DESHBOARD IS READY-
LOAD DATA INFILE 'D:/DATA ANALYTICS/POWER_BI/PROJECT/CREDIT CARD DASHBOARD/cc_add.csv'
INTO TABLE CREDIT_CARD_DETAILS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Optional: ignores the header row if present

LOAD DATA INFILE 'D:/DATA ANALYTICS/POWER_BI/PROJECT/CREDIT CARD DASHBOARD/cust_add.csv'
INTO TABLE  CUST_DETAILS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*
Error Code: 1292. Incorrect date value: '31-12-2023' for column 'Week_Start_Date' at row 1
The error I am seeing indicates that MySQL expects date values in YYYY-MM-DD format, while your data uses DD-MM-YYYY. 

Change the column datatype in excel-
home >>> number >>> formats >>> (drop down menu) >>> more number formats >>> more number formats >>> customs >>> yyyy-mm-dd */



