  CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(25,0), 
	"EMPLOYEE_NAME" VARCHAR2(100), 
	"EMPLOYEE_PHONE" VARCHAR2(15 CHAR), 
	"EMPLOYEE_ADDRESS" VARCHAR2(100), 
	"DEPARTMENT_ID" NUMBER(25,0), 
	"HIRE_DATE" DATE, 
	"SALARY" NUMBER(8,2), 
	"MANAGER" NUMBER, 
	"NOTES" VARCHAR2(100), 
	"EMP_IMAGE" BLOB, 
	"MIMETYPE" VARCHAR2(255), 
	"FILENAME" VARCHAR2(400), 
	"BLOOD_GROUP" VARCHAR2(5), 
	"ONLEAVE" VARCHAR2(3 CHAR), 
	"DOB" DATE, 
	"AGE" NUMBER, 
	"RELIGION" VARCHAR2(50), 
	"GENDER" VARCHAR2(10), 
	"MARITAL_STATUS" VARCHAR2(10), 
	"PERMANENT_ADDRESS" VARCHAR2(400), 
	"NID" VARCHAR2(100), 
	"NATIONALITY" VARCHAR2(50), 
	"TERMINATION_DATE" DATE, 
	"REJOIN_DATE" DATE, 
	"FATHERS_NAME" VARCHAR2(100), 
	"MOTHERS_NAME" VARCHAR2(100), 
	"EMERGENCY_CONTACT_NAME" VARCHAR2(100), 
	"EMERGENCY_CONTACT_NUM" VARCHAR2(20), 
	"EMPLOYMENT_STATUS" VARCHAR2(10), 
	 CONSTRAINT "EMPLOYEE_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PRODUCTS" 
   (	"PRODUCT_ID" NUMBER(4,0), 
	"PRODUCT_NAME" VARCHAR2(100), 
	"PRODUCT_DESCRIPTIONS" VARCHAR2(4000), 
	"LIST_PRICE" NUMBER(9,2), 
	"CATEGORY_ID" NUMBER, 
	"PRODUCT_AVAIL" VARCHAR2(3 CHAR), 
	"PRODUCT_IMAGE" BLOB, 
	"MIMETYPE" VARCHAR2(255 CHAR), 
	"FILENAME" VARCHAR2(400), 
	"PURCHASE_PRICE" NUMBER, 
	"MANUFACTURER_ID" NUMBER, 
	"UNIT" VARCHAR2(50 CHAR), 
	 CONSTRAINT "PRODUCT_ID_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "CATEGORIES" 
   (	"CATEGORY_ID" NUMBER(4,0), 
	"CATEGORY_NAME" VARCHAR2(100), 
	"DESCRIPTION" VARCHAR2(400 CHAR), 
	 CONSTRAINT "CATEGORY_ID_PK" PRIMARY KEY ("CATEGORY_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "COMPANY" 
   (	"COMPANY_ID" NUMBER(10,0), 
	"COMPANY_NAME" VARCHAR2(100), 
	"COMPANY_ADDRESS" VARCHAR2(100), 
	"EMPLOYEE_ID" NUMBER, 
	"SUPPLIER_ID" NUMBER, 
	 CONSTRAINT "COMPANY_ID_PK" PRIMARY KEY ("COMPANY_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "CUSTOMERS" 
   (	"CUSTOMER_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(100), 
	"EMAIL" VARCHAR2(100), 
	"PHONE" VARCHAR2(11), 
	"ADDRESS" VARCHAR2(100), 
	"CITY" VARCHAR2(20), 
	"THANA_UPAZILA" VARCHAR2(50), 
	"POSTAL_CODE" VARCHAR2(10), 
	"CREDIT_LIMIT" NUMBER, 
	"TAGS" VARCHAR2(400), 
	 CONSTRAINT "CUSTOMER_ID_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(25,0), 
	"DEPARTMENT_NAME" VARCHAR2(100), 
	"DEPT_MANAGER" VARCHAR2(100), 
	 CONSTRAINT "DEPARTMENT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "INVENTORY" 
   (	"STOCK_ID" NUMBER(4,0), 
	"PRODUCT_ID" NUMBER, 
	"AMOUNT_IN_STOCK" NUMBER, 
	"RE_ORDER_POINT" NUMBER, 
	"MAX_IN_STOCK" NUMBER, 
	"RE_STOCK_DATE" DATE, 
	"QUANTITY" NUMBER, 
	 CONSTRAINT "STOCK_ID_PK" PRIMARY KEY ("STOCK_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ORDERS" 
   (	"ORDER_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER NOT NULL ENABLE, 
	"ORDER_TOTAL" NUMBER(2,8), 
	"ORDER_TIMESTAMP" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"USER_NAME" VARCHAR2(100 CHAR), 
	"TAGS" VARCHAR2(4000 CHAR), 
	 CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ORDER_ITEMS" 
   (	"ORDER_ITEM_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"ORDER_ID" NUMBER NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER NOT NULL ENABLE, 
	"UNIT_PRICE" NUMBER(2,8) NOT NULL ENABLE, 
	"QUANTITY" NUMBER(2,8) NOT NULL ENABLE, 
	 CONSTRAINT "ORDER_ITEMS_PK" PRIMARY KEY ("ORDER_ITEM_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PURCHASE_MASTER" 
   (	"PURCHASE_ID" NUMBER, 
	"SUPPLIER_ID" NUMBER, 
	"PURCHASE_DATE" DATE, 
	"TOTAL_AMOUNT" NUMBER(10,2), 
	"PAID_AMOUNT" NUMBER(10,2), 
	"DUE_AMOUNT" NUMBER(10,2), 
	"INVOICE_NUMBER" VARCHAR2(100), 
	"CATEGORY_TYPE" NUMBER, 
	 CONSTRAINT "PURCHASE_ID_PK" PRIMARY KEY ("PURCHASE_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PURCHASE_RETURN_MASTER" 
   (	"PUR_RTN_ID" NUMBER, 
	"PURCHASE_ID" NUMBER, 
	"PURCHASE_DATE" DATE, 
	"RETURN_DATE" DATE, 
	"SUPPLIER_ID" NUMBER, 
	"SUPPLIER_NAME" VARCHAR2(500 CHAR), 
	"TOTAL_AMOUNT" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DUE_AMOUNT" NUMBER, 
	"NEW_TOTAL" NUMBER, 
	"TOTAL_RETURN_AMOUNT" NUMBER, 
	"RETURN_RECEIVABLE" NUMBER, 
	 CONSTRAINT "PUR_RTN_MAS_ID_PK" PRIMARY KEY ("PUR_RTN_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PURCHASE_RETURN_TRANSACTIONS" 
   (	"PUR_RTN_DTLS_ID" NUMBER, 
	"PUR_RTN_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(100), 
	"ORDER_QTY" NUMBER, 
	"UNIT_TYPE" VARCHAR2(100), 
	"PRODUCT_TOTAL" NUMBER, 
	"RETURN_QTY" NUMBER, 
	"RETURN_TOTAL" NUMBER, 
	 CONSTRAINT "PUR_RTN_DTLS_ID_PK" PRIMARY KEY ("PUR_RTN_DTLS_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PURCHASE_TRANSACTIONS" 
   (	"PURCHASE_TRANSACTION_ID" NUMBER(4,0), 
	"PRICE" NUMBER, 
	"QUANTITY" NUMBER, 
	"AMOUNT" NUMBER(9,2), 
	"PURCHASE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(100), 
	"UNIT_TYPE" VARCHAR2(100), 
	 CONSTRAINT "PT_ID_PK" PRIMARY KEY ("PURCHASE_TRANSACTION_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SALES_MASTER" 
   (	"SALES_ID" NUMBER(10,0), 
	"CUSTOMER_ID" NUMBER(25,0), 
	"EMPLOYEE_ID" NUMBER(25,0), 
	"SALE_DATE" DATE, 
	"TOTAL_AMOUNT" NUMBER(10,2), 
	"PAID_AMOUNT" NUMBER(10,2), 
	"DUE_AMOUNT" NUMBER(10,2), 
	"INVOICE_ID" NUMBER, 
	"RETURN_AMOUNT" NUMBER, 
	"DISCOUNT_AMOUNT" NUMBER, 
	"DIS_TYPE" VARCHAR2(100), 
	"GIVEN_AMOUNT" NUMBER(10,2), 
	"PAYABLE_AMOUNT" NUMBER(10,2), 
	 CONSTRAINT "SALES_ID_PK" PRIMARY KEY ("SALES_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SALES_RETURN_MASTER" 
   (	"SLS_RTN_ID" NUMBER, 
	"SALES_ID" NUMBER, 
	"SALE_DATE" DATE, 
	"RETURN_DATE" DATE, 
	"CUSTOMER_ID" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DUE_AMOUNT" NUMBER, 
	"NEW_TOTAL" NUMBER, 
	"TOTAL_RETURN_AMOUNT" NUMBER, 
	"RETURN_RECEIVABLE" NUMBER, 
	"DIS_TYPE" VARCHAR2(100 CHAR), 
	"DISCOUNT_AMOUNT" NUMBER, 
	"CUSTOMER_NAME" VARCHAR2(400 CHAR), 
	 CONSTRAINT "SLS_RTN_MAS_ID_PK" PRIMARY KEY ("SLS_RTN_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SALES_RETURN_TRANSACTIONS" 
   (	"SLS_RTN_DTLS_ID" NUMBER, 
	"SLS_RTN_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(100), 
	"ORDER_QTY" NUMBER, 
	"UNIT_TYPE" VARCHAR2(100), 
	"PRODUCT_TOTAL" NUMBER, 
	"RETURN_QTY" NUMBER, 
	"RETURN_TOTAL" NUMBER, 
	"PRICE" NUMBER, 
	 CONSTRAINT "SLS_RTN_DTLS_ID_PK" PRIMARY KEY ("SLS_RTN_DTLS_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SALES_TRANSACTIONS" 
   (	"SALES_TRANSACTION_ID" NUMBER(10,0), 
	"SALES_ID" NUMBER(10,0), 
	"PRODUCT_ID" NUMBER(4,0), 
	"PRICE" NUMBER(10,2), 
	"QUANTITY" NUMBER(10,0), 
	"TOTAL_AMOUNT" NUMBER(10,2), 
	"UNIT" VARCHAR2(100), 
	 CONSTRAINT "SALES_TRANSACTION_ID_PK" PRIMARY KEY ("SALES_TRANSACTION_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SUPPLIERS" 
   (	"SUPPLIER_ID" NUMBER(10,0), 
	"SUPPLIER_COMPANY_NAME" VARCHAR2(100), 
	"SUPPLIER_ADDRESS" VARCHAR2(100), 
	"SUPPLIER_NUMBER" VARCHAR2(15 CHAR), 
	"EMP_ID" NUMBER, 
	"EMAIL" VARCHAR2(200 CHAR), 
	"WEBSITE" VARCHAR2(500 CHAR), 
	 CONSTRAINT "SUPPLIER_ID_PK" PRIMARY KEY ("SUPPLIER_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "USERS" 
   (	"USER_ID" NUMBER, 
	"USER_NAME" VARCHAR2(100), 
	"PASSWORD" VARCHAR2(100), 
	"EMPLOYEE_ID" NUMBER, 
	 CONSTRAINT "USER_ID_PK" PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "CATEGORY_ID" 
before
insert on "CATEGORIES"
for each row
begin
    IF :NEW.CATEGORY_ID IS NULL THEN
        SELECT CATEGORY_ID_SEQ.NEXTVAL INTO :NEW.CATEGORY_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "CATEGORY_ID" ENABLE;

  ALTER TABLE "COMPANY" ADD CONSTRAINT "COM_EMPLOYEE_ID_FK_2" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "COMPANY" ADD CONSTRAINT "SUPPLIER_ID_FK1" FOREIGN KEY ("SUPPLIER_ID")
	  REFERENCES "SUPPLIERS" ("SUPPLIER_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMPANY_ID" 
before
insert on "COMPANY"
for each row
begin
    IF :NEW.COMPANY_ID IS NULL THEN
        SELECT COMPANY_ID_SEQ.NEXTVAL INTO :NEW.COMPANY_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "COMPANY_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "CUSTOMER_ID" 
before
insert on "CUSTOMERS"
for each row
begin
    IF :NEW.CUSTOMER_ID IS NULL THEN
        SELECT CUSTOMER_ID_SEQ.NEXTVAL INTO :NEW.CUSTOMER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "CUSTOMER_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "DEPARTMENT_ID" 
before
insert on "DEPARTMENTS"
for each row
begin
    IF :NEW.DEPARTMENT_ID IS NULL THEN
        SELECT DEPT_ID_SEQ.NEXTVAL INTO :NEW.DEPARTMENT_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "DEPARTMENT_ID" ENABLE;

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "DEPARTMENT_ID_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "EMPLOYEE_ID" 
before
insert on "EMPLOYEES"
for each row
begin
    IF :NEW.EMPLOYEE_ID IS NULL THEN
        SELECT EMP_ID_SEQ.NEXTVAL INTO :NEW.EMPLOYEE_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "EMPLOYEE_ID" ENABLE;

  ALTER TABLE "PRODUCTS" ADD CONSTRAINT "CATEGORY_ID_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "CATEGORIES" ("CATEGORY_ID") ENABLE;
  ALTER TABLE "PRODUCTS" ADD CONSTRAINT "PRODUCTS_MANUFACTURER_ID_FK" FOREIGN KEY ("MANUFACTURER_ID")
	  REFERENCES "COMPANY" ("COMPANY_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRODUCT_ID" 
before
insert on "PRODUCTS"
for each row
begin
    IF :NEW.PRODUCT_ID IS NULL THEN
        SELECT PRODUCTS_ID_SEQ.NEXTVAL INTO :NEW.PRODUCT_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "PRODUCT_ID" ENABLE;

  ALTER TABLE "PURCHASE_MASTER" ADD CONSTRAINT "SUPPLIER_ID_FK" FOREIGN KEY ("SUPPLIER_ID")
	  REFERENCES "SUPPLIERS" ("SUPPLIER_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PUR_RTN_DTLS_ID" 
before
insert on "PURCHASE_RETURN_TRANSACTIONS"
for each row
begin
    IF :NEW.PUR_RTN_DTLS_ID IS NULL THEN
        SELECT PUR_RTN_DTLS_ID_SEQ.NEXTVAL INTO :NEW.PUR_RTN_DTLS_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "PUR_RTN_DTLS_ID" ENABLE;

  ALTER TABLE "PURCHASE_TRANSACTIONS" ADD CONSTRAINT "PRODUCT_ID_FK10" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "PURCHASE_TRANSACTIONS" ADD CONSTRAINT "PURCHASE_ID_FK10" FOREIGN KEY ("PURCHASE_ID")
	  REFERENCES "PURCHASE_MASTER" ("PURCHASE_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "GENERATE_PURCHASE_TRANSACTION_ID" 
BEFORE INSERT ON PURCHASE_TRANSACTIONS 
FOR EACH ROW 
BEGIN 
    IF :NEW.PURCHASE_TRANSACTION_ID IS NULL THEN 
        SELECT purchase_transactions_id_seq.NEXTVAL INTO :NEW.PURCHASE_TRANSACTION_ID FROM dual; 
    END IF; 
END; 

/
ALTER TRIGGER "GENERATE_PURCHASE_TRANSACTION_ID" ENABLE;

  ALTER TABLE "SALES_MASTER" ADD CONSTRAINT "CUSTOMER_ID_FK9" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "CUSTOMERS" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "SALES_MASTER" ADD CONSTRAINT "EMP_ID_FK9" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

  ALTER TABLE "SALES_RETURN_TRANSACTIONS" ADD CONSTRAINT "SLS_RTN_DTLS_PRD_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_TRANSACTIONS" ADD CONSTRAINT "SLS_RTN_DTLS_PUR_FK" FOREIGN KEY ("SLS_RTN_ID")
	  REFERENCES "SALES_RETURN_MASTER" ("SLS_RTN_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SLS_RTN_DTLS_ID" 
before
insert on "SALES_RETURN_TRANSACTIONS"
for each row
begin
    IF :NEW.SLS_RTN_DTLS_ID IS NULL THEN
        SELECT SLS_RTN_DTLS_ID_SEQ.NEXTVAL INTO :NEW.SLS_RTN_DTLS_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SLS_RTN_DTLS_ID" ENABLE;

  ALTER TABLE "SALES_TRANSACTIONS" ADD CONSTRAINT "ORDER_ID_FK" FOREIGN KEY ("SALES_ID")
	  REFERENCES "SALES_MASTER" ("SALES_ID") ENABLE;
  ALTER TABLE "SALES_TRANSACTIONS" ADD CONSTRAINT "PRODUCT_ID_FK8" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "PRODUCTS" ("PRODUCT_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "GENERATE_SALES_TRANSACTION_ID" 
BEFORE INSERT ON sales_transactions 
FOR EACH ROW 
BEGIN 
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN 
        SELECT sales_transactions_id_seq.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual; 
    END IF; 
END; 

/
ALTER TRIGGER "GENERATE_SALES_TRANSACTION_ID" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "SALES_TRANSACTION_ID" 
before
insert on "SALES_TRANSACTIONS"
for each row
begin
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN
        SELECT SALES_TRANSACTIONS_ID_SEQ.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SALES_TRANSACTION_ID" ENABLE;

  ALTER TABLE "SUPPLIERS" ADD CONSTRAINT "EMP_FK3" FOREIGN KEY ("EMP_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SUPPLIER_ID" 
before
insert on "SUPPLIERS"
for each row
begin
    IF :NEW.SUPPLIER_ID IS NULL THEN
        SELECT SUPPLIER_ID_SEQ.NEXTVAL INTO :NEW.SUPPLIER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SUPPLIER_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "USER_ID" 
before
insert on "USERS"
for each row
begin
    IF :NEW.USER_ID IS NULL THEN
        SELECT USER_ID_SEQ.NEXTVAL INTO :NEW.USER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "USER_ID" ENABLE;

  CREATE UNIQUE INDEX "CATEGORY_ID_PK" ON "CATEGORIES" ("CATEGORY_ID") 
  ;

  CREATE UNIQUE INDEX "COMPANY_ID_PK" ON "COMPANY" ("COMPANY_ID") 
  ;

  CREATE UNIQUE INDEX "CUSTOMER_ID_PK" ON "CUSTOMERS" ("CUSTOMER_ID") 
  ;

  CREATE UNIQUE INDEX "DEPARTMENT_ID_PK" ON "DEPARTMENTS" ("DEPARTMENT_ID") 
  ;

  CREATE UNIQUE INDEX "EMPLOYEE_ID_PK" ON "EMPLOYEES" ("EMPLOYEE_ID") 
  ;

  CREATE UNIQUE INDEX "ORDERS_PK" ON "ORDERS" ("ORDER_ID") 
  ;

  CREATE UNIQUE INDEX "ORDER_ITEMS_PK" ON "ORDER_ITEMS" ("ORDER_ITEM_ID") 
  ;

  CREATE UNIQUE INDEX "PRODUCT_ID_PK" ON "PRODUCTS" ("PRODUCT_ID") 
  ;

  CREATE UNIQUE INDEX "PT_ID_PK" ON "PURCHASE_TRANSACTIONS" ("PURCHASE_TRANSACTION_ID") 
  ;

  CREATE UNIQUE INDEX "PURCHASE_ID_PK" ON "PURCHASE_MASTER" ("PURCHASE_ID") 
  ;

  CREATE UNIQUE INDEX "PUR_RTN_DTLS_ID_PK" ON "PURCHASE_RETURN_TRANSACTIONS" ("PUR_RTN_DTLS_ID") 
  ;

  CREATE UNIQUE INDEX "PUR_RTN_MAS_ID_PK" ON "PURCHASE_RETURN_MASTER" ("PUR_RTN_ID") 
  ;

  CREATE UNIQUE INDEX "SALES_ID_PK" ON "SALES_MASTER" ("SALES_ID") 
  ;

  CREATE UNIQUE INDEX "SALES_TRANSACTION_ID_PK" ON "SALES_TRANSACTIONS" ("SALES_TRANSACTION_ID") 
  ;

  CREATE UNIQUE INDEX "SLS_RTN_DTLS_ID_PK" ON "SALES_RETURN_TRANSACTIONS" ("SLS_RTN_DTLS_ID") 
  ;

  CREATE UNIQUE INDEX "SLS_RTN_MAS_ID_PK" ON "SALES_RETURN_MASTER" ("SLS_RTN_ID") 
  ;

  CREATE UNIQUE INDEX "STOCK_ID_PK" ON "INVENTORY" ("STOCK_ID") 
  ;

  CREATE UNIQUE INDEX "SUPPLIER_ID_PK" ON "SUPPLIERS" ("SUPPLIER_ID") 
  ;

  CREATE UNIQUE INDEX "USER_ID_PK" ON "USERS" ("USER_ID") 
  ;






























































create or replace trigger "CATEGORY_ID"
before
insert on "CATEGORIES"
for each row
begin
    IF :NEW.CATEGORY_ID IS NULL THEN
        SELECT CATEGORY_ID_SEQ.NEXTVAL INTO :NEW.CATEGORY_ID FROM dual;
    END IF;
end;
/
create or replace trigger "COMPANY_ID"
before
insert on "COMPANY"
for each row
begin
    IF :NEW.COMPANY_ID IS NULL THEN
        SELECT COMPANY_ID_SEQ.NEXTVAL INTO :NEW.COMPANY_ID FROM dual;
    END IF;
end;
/
create or replace trigger "CUSTOMER_ID"
before
insert on "CUSTOMERS"
for each row
begin
    IF :NEW.CUSTOMER_ID IS NULL THEN
        SELECT CUSTOMER_ID_SEQ.NEXTVAL INTO :NEW.CUSTOMER_ID FROM dual;
    END IF;
end;
/
create or replace trigger "DEPARTMENT_ID"
before
insert on "DEPARTMENTS"
for each row
begin
    IF :NEW.DEPARTMENT_ID IS NULL THEN
        SELECT DEPT_ID_SEQ.NEXTVAL INTO :NEW.DEPARTMENT_ID FROM dual;
    END IF;
end;
/
create or replace trigger "EMPLOYEE_ID"
before
insert on "EMPLOYEES"
for each row
begin
    IF :NEW.EMPLOYEE_ID IS NULL THEN
        SELECT EMP_ID_SEQ.NEXTVAL INTO :NEW.EMPLOYEE_ID FROM dual;
    END IF;
end;
/
create or replace TRIGGER generate_purchase_TRANSACTION_ID 
BEFORE INSERT ON PURCHASE_TRANSACTIONS 
FOR EACH ROW 
BEGIN 
    IF :NEW.PURCHASE_TRANSACTION_ID IS NULL THEN 
        SELECT purchase_transactions_id_seq.NEXTVAL INTO :NEW.PURCHASE_TRANSACTION_ID FROM dual; 
    END IF; 
END; 
/
create or replace TRIGGER generate_SALES_TRANSACTION_ID 
BEFORE INSERT ON sales_transactions 
FOR EACH ROW 
BEGIN 
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN 
        SELECT sales_transactions_id_seq.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual; 
    END IF; 
END; 
/
create or replace trigger "PRODUCT_ID"
before
insert on "PRODUCTS"
for each row
begin
    IF :NEW.PRODUCT_ID IS NULL THEN
        SELECT PRODUCTS_ID_SEQ.NEXTVAL INTO :NEW.PRODUCT_ID FROM dual;
    END IF;
end;
/
create or replace trigger "SALES_TRANSACTION_ID"
before
insert on "SALES_TRANSACTIONS"
for each row
begin
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN
        SELECT SALES_TRANSACTIONS_ID_SEQ.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual;
    END IF;
end;
/
create or replace trigger "SUPPLIER_ID"
before
insert on "SUPPLIERS"
for each row
begin
    IF :NEW.SUPPLIER_ID IS NULL THEN
        SELECT SUPPLIER_ID_SEQ.NEXTVAL INTO :NEW.SUPPLIER_ID FROM dual;
    END IF;
end;
/
create or replace trigger "USER_ID"
before
insert on "USERS"
for each row
begin
    IF :NEW.USER_ID IS NULL THEN
        SELECT USER_ID_SEQ.NEXTVAL INTO :NEW.USER_ID FROM dual;
    END IF;
end;
/






















create or replace PROCEDURE insert_purchase_data(
    P4_PURCHASE_ID   IN NUMBER,
    P4_SUPPLIER_ID   IN NUMBER,
    P4_PURCHASE_DATE IN DATE,
    P4_TOTAL_AMOUNT  IN NUMBER,
    P4_PAID_AMOUNT   IN NUMBER,
    P4_DUE_AMOUNT    IN NUMBER,
    P4_CATEGORY_TYPE IN VARCHAR2
) IS
BEGIN
    -- Insert into PURCHASE_MASTER table
    INSERT INTO PURCHASE_MASTER (
        PURCHASE_ID, SUPPLIER_ID, PURCHASE_DATE, TOTAL_AMOUNT, PAID_AMOUNT, DUE_AMOUNT, CATEGORY_TYPE
    ) VALUES (
        P4_PURCHASE_ID, P4_SUPPLIER_ID, P4_PURCHASE_DATE, P4_TOTAL_AMOUNT, P4_PAID_AMOUNT, P4_DUE_AMOUNT, P4_CATEGORY_TYPE
    );

    -- Insert into PURCHASE_TRANSACTIONS table
    FOR i IN (
        SELECT p_N001 ID, P_N002 PRICE, p_C001 UNIT, p_N003 Qty, P_N004 AMOUNT
        FROM apex_collections
        WHERE collection_name = 'PURCHASE'
    ) LOOP
        INSERT INTO PURCHASE_TRANSACTIONS (
            PURCHASE_ID, PRODUCT_ID, PRICE, UNIT_TYPE, QUANTITY, AMOUNT
        ) VALUES (
            P4_PURCHASE_ID, i.ID, i.PRICE, i.UNIT, i.Qty, i.AMOUNT
        );
    END LOOP;
--    COMMIT;
END insert_purchase_data;
/
create or replace PROCEDURE insert_purchase_master_details (
   P_SUPPLIER_ID     IN NUMBER,
   P_PURCHASE_DATE   IN DATE,
   P_TOTAL_AMOUNT    IN NUMBER,
   P_PAID_AMOUNT     IN NUMBER,
   P_DUE_AMOUNT      IN NUMBER,
   P_CATEGORY_TYPE   IN NUMBER)
IS
   v_purchase_id   NUMBER;

   CURSOR c_col
   IS
      SELECT N001 AS Pro_ID,
             N002 AS PRICE,
             C001 AS UNIT,
             N003 AS Qty,
             N004 AS AMOUNT
        FROM apex_collections
       WHERE collection_name = 'PURCHASE';

BEGIN
   -- Generate new PURCHASE_ID
   SELECT NVL(MAX(PURCHASE_ID), 0) + 1
     INTO v_purchase_id
     FROM PURCHASE_MASTER;

   -- Insert into PURCHASE_MASTER
   INSERT INTO PURCHASE_MASTER (PURCHASE_ID,
                                SUPPLIER_ID,
                                PURCHASE_DATE,
                                TOTAL_AMOUNT,
                                PAID_AMOUNT,
                                DUE_AMOUNT,
                                CATEGORY_TYPE)
        VALUES (v_purchase_id,
                P_SUPPLIER_ID,
                P_PURCHASE_DATE,
                P_TOTAL_AMOUNT,
                P_PAID_AMOUNT,
                P_DUE_AMOUNT,
                P_CATEGORY_TYPE);

   -- Insert into PURCHASE_TRANSACTIONS
   FOR i IN c_col
   LOOP
      INSERT INTO PURCHASE_TRANSACTIONS (PURCHASE_ID,
                                         PRODUCT_ID,
                                         PRICE,
                                         UNIT_TYPE,
                                         QUANTITY,
                                         AMOUNT)
           VALUES (v_purchase_id,
                   i.Pro_ID,
                   i.PRICE,
                   i.UNIT,
                   i.Qty,
                   i.AMOUNT);
   END LOOP;

   COMMIT;
   
   -- Set success message for APEX
   apex_application.g_print_success_message := 'Successfully Purchased';

EXCEPTION
   WHEN OTHERS THEN
      -- Log or handle the error as appropriate
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
      ROLLBACK; -- Rollback changes on error
END insert_purchase_master_details;
/
create or replace PROCEDURE insert_purchase_master_detaisl (
   P_SUPPLIER_ID     IN NUMBER,
   P_PURCHASE_DATE   IN DATE,
   P_TOTAL_AMOUNT    IN NUMBER,
   P_PAID_AMOUNT     IN NUMBER,
   P_DUE_AMOUNT      IN NUMBER,
   P_CATEGORY_TYPE   IN NUMBER)
IS
   v_purchase_id   NUMBER;

   CURSOR c_col
   IS
      SELECT N001 AS Pro_ID,
             N002 AS PRICE,
             C001 AS UNIT,
             N003 AS Qty,
             N004 AS AMOUNT
        FROM apex_collections
       WHERE collection_name = 'PURCHASE';
BEGIN
   SELECT NVL (MAX (PURCHASE_ID), 0) + 1
     INTO v_purchase_id
     FROM PURCHASE_MASTER;


   INSERT INTO PURCHASE_MASTER (PURCHASE_ID,
                                SUPPLIER_ID,
                                PURCHASE_DATE,
                                TOTAL_AMOUNT,
                                PAID_AMOUNT,
                                DUE_AMOUNT,
                                CATEGORY_TYPE)
        VALUES (v_purchase_id,
                P_SUPPLIER_ID,
                P_PURCHASE_DATE,
                P_TOTAL_AMOUNT,
                P_PAID_AMOUNT,
                P_DUE_AMOUNT,
                P_CATEGORY_TYPE);

   IF v_purchase_id IS NOT NULL
   THEN
      FOR i IN c_col
      LOOP
         INSERT INTO PURCHASE_TRANSACTIONS (PURCHASE_ID,
                                            PRODUCT_ID,
                                            PRICE,
                                            UNIT_TYPE,
                                            QUANTITY,
                                            AMOUNT)
              VALUES (v_purchase_id,
                      i.Pro_ID,
                      i.PRICE,
                      i.UNIT,
                      i.Qty,
                      i.AMOUNT);
      END LOOP;
  
   commit;
    apex_application.g_print_success_message := 'Record Inserted';

     END IF;
END;
/
create or replace PROCEDURE insert_sales_master_detais (
   P_CUSTOMER_ID IN NUMBER,
   P_SALE_DATE IN DATE,
   P_EMPLOYEE_ID IN NUMBER,
   P_TOTAL_AMOUNT IN NUMBER,
   P_DIS_TYPE IN VARCHAR2,
   P_DISCOUNT_AMOUNT IN NUMBER,
   P_PAYABLE_AMOUNT IN NUMBER,
   P_PAID_AMOUNT IN NUMBER,
   P_RETURN_AMOUNT IN NUMBER,
   P_DUE_AMOUNT IN NUMBER)
IS
   v_SALES_ID   NUMBER;

   CURSOR c_col
   IS
      SELECT N001 AS PRODUCT_ID,
             N002 AS PRICE,
             C001 AS UNIT_TYPE,
             N003 AS QUANTITY,
             N004 AS AMOUNT
        FROM apex_collections
       WHERE collection_name = 'SALE';
BEGIN
   SELECT NVL (MAX (SALES_ID), 0) + 1
     INTO v_SALES_ID
     FROM SALES_MASTER;


   INSERT INTO SALES_MASTER (SALES_ID, CUSTOMER_ID, EMPLOYEE_ID, SALE_DATE, TOTAL_AMOUNT, PAID_AMOUNT, DUE_AMOUNT, RETURN_AMOUNT, DISCOUNT_AMOUNT, DIS_TYPE, PAYABLE_AMOUNT)
        VALUES (v_SALES_ID, P_CUSTOMER_ID, P_EMPLOYEE_ID, P_SALE_DATE, P_TOTAL_AMOUNT, P_PAID_AMOUNT, P_DUE_AMOUNT, P_RETURN_AMOUNT, P_DISCOUNT_AMOUNT, P_DIS_TYPE, P_PAYABLE_AMOUNT);

   IF v_SALES_ID IS NOT NULL
   THEN
      FOR i IN c_col
      LOOP
         INSERT INTO SALES_TRANSACTIONS (SALES_ID, PRODUCT_ID, PRICE, QUANTITY, TOTAL_AMOUNT, UNIT)
              VALUES (v_SALES_ID, i.PRODUCT_ID, i.PRICE, i.QUANTITY, i.AMOUNT, i.UNIT_TYPE);
      END LOOP;
  
   commit;
    apex_application.g_print_success_message := 'Record Inserted';

     END IF;
END;
/
create or replace PROCEDURE save_products_collection
IS
    v_purchase_id NUMBER;
BEGIN
    SELECT NVL(MAX(PURCHASE_ID), 0) + 1 INTO v_purchase_id FROM PURCHASE_MASTER;
    
    INSERT INTO PURCHASE_MASTER (PURCHASE_ID, SUPPLIER_ID, PURCHASE_DATE, TOTAL_AMOUNT, PAID_AMOUNT, DUE_AMOUNT, CATEGORY_TYPE)
		VALUES(v_purchase_id, :P4_SUPPLIER_ID, :P4_PURCHASE_DATE, :P4_TOTAL_AMOUNT, :P4_PAID_AMOUNT, :P4_DUE_AMOUNT, :P4_CATEGORY_TYPE);
    
    FOR i IN (SELECT N001 AS Pro_ID, N002 AS PRICE, C001 AS UNIT, N003 AS Qty, N004 AS AMOUNT
		FROM apex_collections WHERE collection_name = 'PURCHASE')
    LOOP
	INSERT INTO PURCHASE_TRANSACTIONS (PURCHASE_ID, PRODUCT_ID, PRICE, UNIT_TYPE, QUANTITY, AMOUNT)
		VALUES(v_purchase_id, i.Pro_ID, i.PRICE, i.UNIT, i.Qty, i.AMOUNT);
    END LOOP;
END;
/





















































   CREATE SEQUENCE  "CATEGORY_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 110 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "COMPANY_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 280 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "CUSTOMER_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 260 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "DEPT_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 10 START WITH 610 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "DUE_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 900 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "EMP_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "PRODUCTS_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 5180 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "PURCHASE_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 300 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "PURCHASE_TRANSACTIONS_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1180 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "PUR_RTN_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SALES_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 900 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SALES_TRANSACTIONS_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 420 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SLS_RTN_DTLS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 200 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SLS_RTN_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "STOCK_ID_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SUPPLIER_ID_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 280 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "USER_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PURCHASE_DUES_VIEW" ("PURCHASE_ID", "SUPPLIER_ID", "SUPPLIER_NAME", "PRODUCT_ID", "PRODUCT_NAME", "PURCHASE_DATE", "TOTAL_AMOUNT", "PAID_AMOUNT", "DUE_AMOUNT") AS 
  SELECT 
    pm.purchase_id, 
    pm.supplier_id, 
    s.supplier_company_name AS supplier_name, 
    pt.product_id, 
    p.product_name, 
    pm.purchase_date, 
    pm.total_amount, 
    pm.paid_amount, 
    pm.due_amount 
FROM purchase_master pm 
JOIN purchase_transactions pt ON pm.purchase_id = pt.purchase_id 
JOIN products p ON pt.product_id = p.product_id 
JOIN suppliers s ON pm.supplier_id = s.supplier_id 
WHERE pm.due_amount IS NOT NULL AND pm.due_amount <> 0
;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SALES_DUES_VIEW" ("SALES_ID", "CUSTOMER_ID", "CUSTOMER_NAME", "PRODUCT_ID", "PRODUCT_NAME", "SALE_DATE", "TOTAL_AMOUNT", "PAID_AMOUNT", "DUE_AMOUNT") AS 
  SELECT 
    sm.sales_id, 
    sm.customer_id, 
    c.name AS customer_name, 
    st.product_id, 
    p.product_name, 
    sm.sale_date, 
    sm.total_amount, 
    sm.paid_amount, 
    sm.due_amount 
FROM sales_master sm 
JOIN sales_transactions st ON sm.sales_id = st.sales_id 
JOIN products p ON st.product_id = p.product_id 
JOIN customers c ON sm.customer_id = c.customer_id 
WHERE sm.due_amount IS NOT NULL AND sm.due_amount <> 0
;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "STOCK_VIEW" ("PRODUCT_ID", "PRODUCT_NAME", "STOCK_QTY") AS 
  SELECT 
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    SUM(stock_qty) AS stock_qty
FROM (
    SELECT 
        pt.product_id, 
        SUM(pt.quantity) AS stock_qty
    FROM (
        -- Purchase
        SELECT product_id, quantity
        FROM purchase_transactions
        WHERE purchase_transaction_id IS NOT NULL
        UNION ALL
        -- Sales
        SELECT product_id, -quantity
        FROM sales_transactions
        WHERE sales_transaction_id IS NOT NULL
        UNION ALL
        -- Purchase returns
        SELECT product_id, -RETURN_QTY
        FROM PURCHASE_RETURN_TRANSACTIONS
        WHERE PUR_RTN_ID IS NOT NULL
        UNION ALL
        -- Sales returns
        SELECT product_id, RETURN_QTY
        FROM SALES_RETURN_TRANSACTIONS
        WHERE SLS_RTN_ID IS NOT NULL
    ) pt
    GROUP BY pt.product_id
) iq
JOIN products p ON p.product_id = iq.product_id
GROUP BY p.product_id, p.product_name;

  CREATE OR REPLACE EDITIONABLE TRIGGER "CATEGORY_ID" 
before
insert on "CATEGORIES"
for each row
begin
    IF :NEW.CATEGORY_ID IS NULL THEN
        SELECT CATEGORY_ID_SEQ.NEXTVAL INTO :NEW.CATEGORY_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "CATEGORY_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMPANY_ID" 
before
insert on "COMPANY"
for each row
begin
    IF :NEW.COMPANY_ID IS NULL THEN
        SELECT COMPANY_ID_SEQ.NEXTVAL INTO :NEW.COMPANY_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "COMPANY_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "CUSTOMER_ID" 
before
insert on "CUSTOMERS"
for each row
begin
    IF :NEW.CUSTOMER_ID IS NULL THEN
        SELECT CUSTOMER_ID_SEQ.NEXTVAL INTO :NEW.CUSTOMER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "CUSTOMER_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "DEPARTMENT_ID" 
before
insert on "DEPARTMENTS"
for each row
begin
    IF :NEW.DEPARTMENT_ID IS NULL THEN
        SELECT DEPT_ID_SEQ.NEXTVAL INTO :NEW.DEPARTMENT_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "DEPARTMENT_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "EMPLOYEE_ID" 
before
insert on "EMPLOYEES"
for each row
begin
    IF :NEW.EMPLOYEE_ID IS NULL THEN
        SELECT EMP_ID_SEQ.NEXTVAL INTO :NEW.EMPLOYEE_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "EMPLOYEE_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRODUCT_ID" 
before
insert on "PRODUCTS"
for each row
begin
    IF :NEW.PRODUCT_ID IS NULL THEN
        SELECT PRODUCTS_ID_SEQ.NEXTVAL INTO :NEW.PRODUCT_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "PRODUCT_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PUR_RTN_DTLS_ID" 
before
insert on "PURCHASE_RETURN_TRANSACTIONS"
for each row
begin
    IF :NEW.PUR_RTN_DTLS_ID IS NULL THEN
        SELECT PUR_RTN_DTLS_ID_SEQ.NEXTVAL INTO :NEW.PUR_RTN_DTLS_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "PUR_RTN_DTLS_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "GENERATE_PURCHASE_TRANSACTION_ID" 
BEFORE INSERT ON PURCHASE_TRANSACTIONS 
FOR EACH ROW 
BEGIN 
    IF :NEW.PURCHASE_TRANSACTION_ID IS NULL THEN 
        SELECT purchase_transactions_id_seq.NEXTVAL INTO :NEW.PURCHASE_TRANSACTION_ID FROM dual; 
    END IF; 
END; 

/
ALTER TRIGGER "GENERATE_PURCHASE_TRANSACTION_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SLS_RTN_DTLS_ID" 
before
insert on "SALES_RETURN_TRANSACTIONS"
for each row
begin
    IF :NEW.SLS_RTN_DTLS_ID IS NULL THEN
        SELECT SLS_RTN_DTLS_ID_SEQ.NEXTVAL INTO :NEW.SLS_RTN_DTLS_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SLS_RTN_DTLS_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "GENERATE_SALES_TRANSACTION_ID" 
BEFORE INSERT ON sales_transactions 
FOR EACH ROW 
BEGIN 
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN 
        SELECT sales_transactions_id_seq.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual; 
    END IF; 
END; 

/
ALTER TRIGGER "GENERATE_SALES_TRANSACTION_ID" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "SALES_TRANSACTION_ID" 
before
insert on "SALES_TRANSACTIONS"
for each row
begin
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN
        SELECT SALES_TRANSACTIONS_ID_SEQ.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SALES_TRANSACTION_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "SUPPLIER_ID" 
before
insert on "SUPPLIERS"
for each row
begin
    IF :NEW.SUPPLIER_ID IS NULL THEN
        SELECT SUPPLIER_ID_SEQ.NEXTVAL INTO :NEW.SUPPLIER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "SUPPLIER_ID" ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "USER_ID" 
before
insert on "USERS"
for each row
begin
    IF :NEW.USER_ID IS NULL THEN
        SELECT USER_ID_SEQ.NEXTVAL INTO :NEW.USER_ID FROM dual;
    END IF;
end;
/
ALTER TRIGGER "USER_ID" ENABLE;