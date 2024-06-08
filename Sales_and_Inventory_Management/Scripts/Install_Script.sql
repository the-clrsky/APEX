-- Create User 
CREATE USER sales IDENTIFIED BY s;

-- Grant Privileges
GRANT CONNECT, RESOURCE, DBA TO sales;

-- Grant Tablespace Quota
ALTER USER sales QUOTA 10G ON USERS;

-- Connect to User
CONN sales/s@//localhost:1521/orclpdb;

-- Create Tables --

CREATE TABLE company (
    company_id NUMBER(10) CONSTRAINT company_id_pk PRIMARY KEY,
    company_name VARCHAR2(100),
    company_address VARCHAR2(100),
    employee_id NUMBER
);

CREATE TABLE employees (
    employee_id NUMBER(25) CONSTRAINT employee_id_pk PRIMARY KEY,
    employee_name VARCHAR2(100),
    employee_phone NUMBER(14),
    employee_address VARCHAR2(100),
    department_id NUMBER(25),
    hire_date DATE
);

CREATE TABLE departments (
    department_id NUMBER(25) CONSTRAINT department_id_pk PRIMARY KEY,
    department_name VARCHAR2(100)
);

CREATE TABLE users (
    user_id NUMBER CONSTRAINT user_id_pk PRIMARY KEY,
    user_name VARCHAR2(100),
    password VARCHAR2(100),
    employee_id NUMBER
);

CREATE TABLE suppliers (
    supplier_id NUMBER(10) CONSTRAINT supplier_id_pk PRIMARY KEY,
    supplier_company_name VARCHAR2(100), 
    supplier_address VARCHAR2(100),
    supplier_number NUMBER(14),
    company_id NUMBER
);

CREATE TABLE purchase_master (
    purchase_id NUMBER CONSTRAINT purchase_id_pk PRIMARY KEY, 
    supplier_id NUMBER,
    purchase_date DATE,
    Total_AMOUNT NUMBER(10,2),
    Paid_Amount NUMBER(10,2),
    Due_AMOUNT NUMBER(10,2)
); 

CREATE TABLE purchase_transactions (
    purchase_transaction_id NUMBER(4) CONSTRAINT pt_id_pk PRIMARY KEY,
    price NUMBER,
    quantity NUMBER,
    amount NUMBER(9,2)
);

CREATE TABLE products (
    product_id NUMBER(4) CONSTRAINT product_id_pk PRIMARY KEY,
    product_name VARCHAR2(100),
    product_descriptions VARCHAR2(250),
    price NUMBER(9,2),
    category_id NUMBER
);

CREATE TABLE categories (
    category_id NUMBER(4) CONSTRAINT category_id_pk PRIMARY KEY,
    category_name VARCHAR2(100)
);

CREATE TABLE inventory (
    stock_id NUMBER(4) CONSTRAINT stock_id_pk PRIMARY KEY,
    product_id NUMBER,
    amount_in_stock NUMBER,
    re_order_point NUMBER,
    max_in_stock NUMBER,
    re_stock_date DATE,
    quantity NUMBER
);

CREATE TABLE customers (
    customer_id NUMBER(10) CONSTRAINT customer_id_pk PRIMARY KEY,
    name VARCHAR2(100),
    email VARCHAR2(100),
    phone NUMBER(15),
    address VARCHAR2(100)
);

CREATE TABLE sales_master (
    sales_id NUMBER(10) CONSTRAINT sales_id_pk PRIMARY KEY,
    customer_id NUMBER(25),
    employee_id NUMBER(25),
    sale_date DATE,
    Total_AMOUNT NUMBER(10,2),
    Paid_Amount NUMBER(10,2),
    Due_AMOUNT NUMBER(10,2)
);

CREATE TABLE sales_transactions (
    sales_transaction_id NUMBER(10) CONSTRAINT sales_transaction_id_pk PRIMARY KEY,
    sales_id NUMBER(10),
    product_id NUMBER(4),
    price NUMBER(10,2),
    quantity NUMBER(10),
    total_amount NUMBER(10,2)
); 


Create TABLE PURCHASE_RETURN_MASTER (
PUR_RTN_ID NUMBER NUMBER CONSTRAINT pur_rtn_mas_id_pk PRIMARY KEY,
PURCHASE_ID NUMBER,
PURCHASE_DATE DATE,
RETURN_DATE DATE,
SUPPLIER_ID NUMBER,
SUPPLIER_NAME VARCHAR2(50));

ALTER TABLE PURCHASE_RETURN_MASTER
ADD (TOTAL_AMOUNT NUMBER, 
PAID_AMOUNT NUMBER, DUE_AMOUNT NUMBER);

Create TABLE PURCHASE_RETURN_TRANSACTIONS (
PUR_RTN_DTLS_ID NUMBER NUMBER CONSTRAINT pur_rtn_dtls_id_pk PRIMARY KEY,
PUR_RTN_ID NUMBER,
PRODUCT_ID NUMBER,
PRODUCT_NAME VARCHAR2(100),
ORDER_QTY NUMBER,
UNIT_TYPE VARCHAR2(100),
PRODUCT_TOTAL NUMBER,
RETURN_QTY NUMBER,
RETURN_TOTAL NUMBER);

Create TABLE SALES_RETURN_MASTER (
SLS_RTN_ID NUMBER CONSTRAINT sls_rtn_mas_id_pk PRIMARY KEY,
SALES_ID NUMBER,
SALE_DATE DATE,
RETURN_DATE DATE,
CUSTOMER_ID NUMBER);

Create TABLE SALES_RETURN_TRANSACTIONS (
SLS_RTN_DTLS_ID NUMBER CONSTRAINT sls_rtn_dtls_id_pk PRIMARY KEY,
SLS_RTN_ID NUMBER,
PRODUCT_ID NUMBER,
PRODUCT_NAME VARCHAR2(100),
ORDER_QTY NUMBER,
UNIT_TYPE VARCHAR2(100),
PRODUCT_TOTAL NUMBER,
RETURN_QTY NUMBER,
RETURN_TOTAL NUMBER);

COMMIT;

-- Add Foreign Key References --

-- Employees
ALTER TABLE employees
ADD CONSTRAINT department_id_fk FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Company
ALTER TABLE company
ADD CONSTRAINT com_employee_id_fk_2 FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

-- Suppliers
ALTER TABLE suppliers
ADD CONSTRAINT company_id_fk FOREIGN KEY (company_id) REFERENCES company(company_id);

-- Purchase Master
ALTER TABLE purchase_master
ADD CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);

-- Products
ALTER TABLE products
ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES categories(category_id);

-- Sales Transactions
ALTER TABLE sales_transactions 
ADD CONSTRAINT order_id_fk FOREIGN KEY (sales_id) REFERENCES sales_master(sales_id)
ADD CONSTRAINT product_id_fk8 FOREIGN KEY (product_id) REFERENCES products(product_id);

-- Sales Master
ALTER TABLE sales_master
ADD CONSTRAINT customer_id_fk9 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ADD CONSTRAINT emp_id_fk9 FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

-- Purchase Transactions
ALTER TABLE purchase_transactions 
ADD (purchase_id NUMBER, CONSTRAINT purchase_id_fk10 FOREIGN KEY (purchase_id) REFERENCES purchase_master(purchase_id),
product_id NUMBER, CONSTRAINT product_id_fk10 FOREIGN KEY (product_id) REFERENCES products(product_id));


ALTER TABLE PURCHASE_TRANSACTIONS 
ADD (PRODUCT_NAME VARCHAR2(100),
UNIT_TYPE VARCHAR2(100));

ALTER TABLE PURCHASE_RETURN_MASTER
ADD CONSTRAINT pur_rtn_mas_id_fk FOREIGN KEY (PURCHASE_ID) REFERENCES PURCHASE_MASTER(PURCHASE_ID)
ADD CONSTRAINT pur_rtn_mas_sup_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)

ALTER TABLE PURCHASE_RETURN_TRANSACTIONS
ADD CONSTRAINT pur_rtn_dtls_pur_fk FOREIGN KEY (PUR_RTN_ID) REFERENCES PURCHASE_RETURN_MASTER (PUR_RTN_ID)
ADD CONSTRAINT pur_rtn_dtls_prd_id_fk FOREIGN KEY (product_id) REFERENCES products(product_id)

ALTER TABLE SALES_RETURN_MASTER
ADD CONSTRAINT sls_rtn_mas_id_fk FOREIGN KEY (SALES_ID) REFERENCES sales_master(SALES_ID)
ADD CONSTRAINT sls_rtn_mas_cus_id_fk FOREIGN KEY (CUSTOMER_ID) REFERENCES customers(customer_id);

ALTER TABLE SALES_RETURN_TRANSACTIONS
ADD CONSTRAINT sls_rtn_dtls_pur_fk FOREIGN KEY (SLS_RTN_ID) REFERENCES SALES_RETURN_MASTER(SLS_RTN_ID)
ADD CONSTRAINT sls_rtn_dtls_prd_id_fk FOREIGN KEY (product_id) REFERENCES products(product_id);

COMMIT;

-- Create Sequences --

CREATE SEQUENCE supplier_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999999;

CREATE SEQUENCE emp_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE dept_id_seq
START WITH 10
INCREMENT BY 10
MAXVALUE 99999;

CREATE SEQUENCE customer_id_seq
START WITH 200
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE products_id_seq
START WITH 5000
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE category_id_seq
START WITH 50
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE stock_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE purchase_id_seq
START WITH 300
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE purchase_transactions_id_seq
START WITH 700
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE sales_id_seq
START WITH 900
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE sales_transactions_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE due_id_seq
START WITH 900
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE sls_rtn_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE pur_rtn_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE Company_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 99999;

CREATE SEQUENCE sls_rtn_dtls_id_seq
START WITH 100
INCREMENT BY 1
MAXVALUE 9999;

COMMIT;
