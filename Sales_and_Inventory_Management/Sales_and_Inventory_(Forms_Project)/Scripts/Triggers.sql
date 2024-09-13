--- Triggers

-- Sales_Transaction_ID
CREATE OR REPLACE TRIGGER generate_SALES_TRANSACTION_ID
BEFORE INSERT ON sales_transactions
FOR EACH ROW
BEGIN
    IF :NEW.SALES_TRANSACTION_ID IS NULL THEN
        SELECT sales_transactions_id_seq.NEXTVAL INTO :NEW.SALES_TRANSACTION_ID FROM dual;
    END IF;
END;
/

-- Purchase_Transaction_ID
CREATE OR REPLACE TRIGGER generate_purchase_TRANSACTION_ID
BEFORE INSERT ON PURCHASE_TRANSACTIONS
FOR EACH ROW
BEGIN
    IF :NEW.PURCHASE_TRANSACTION_ID IS NULL THEN
        SELECT purchase_transactions_id_seq.NEXTVAL INTO :NEW.PURCHASE_TRANSACTION_ID FROM dual;
    END IF;
END;
/

-- Sales_Return_ID
CREATE OR REPLACE TRIGGER generate_sls_rtn_id
BEFORE INSERT ON sales_return
FOR EACH ROW
BEGIN
    IF :NEW.sls_rtn_id IS NULL THEN
        SELECT sls_rtn_id_seq.NEXTVAL INTO :NEW.sls_rtn_id FROM dual;
    END IF;
END;
/

-- Purchase_Return_ID
CREATE OR REPLACE TRIGGER generate_pur_rtn_id
BEFORE INSERT ON purchase_return
FOR EACH ROW
BEGIN
    IF :NEW.PUR_RTN_ID IS NULL THEN
        SELECT pur_rtn_id_seq.NEXTVAL INTO :NEW.PUR_RTN_ID FROM dual;
    END IF;
END;
/