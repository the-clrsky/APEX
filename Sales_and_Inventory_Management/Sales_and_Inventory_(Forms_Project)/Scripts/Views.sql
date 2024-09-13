-- Inventory View

CREATE OR REPLACE VIEW "STOCK_VIEW" ("PRODUCT_ID", "PRODUCT_NAME", "STOCK_QTY") AS
SELECT 
    p.product_id,
    p.product_name,
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

-- Purchase Dues View

CREATE OR REPLACE VIEW "PURCHASE_DUES_VIEW" (
    "PURCHASE_ID",
    "SUPPLIER_ID",
    "SUPPLIER_NAME",
    "PRODUCT_ID",
    "PRODUCT_NAME",
    "PURCHASE_DATE",
    "TOTAL_AMOUNT",
    "PAID_AMOUNT",
    "DUE_AMOUNT" ) 
AS SELECT
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
WHERE pm.due_amount IS NOT NULL AND pm.due_amount <> 0;

-- Sales Dues View

CREATE OR REPLACE VIEW "SALES_DUES_VIEW" (
    "SALES_ID",
    "CUSTOMER_ID",
    "CUSTOMER_NAME",
    "PRODUCT_ID",
    "PRODUCT_NAME",
    "SALE_DATE",
    "TOTAL_AMOUNT",
    "PAID_AMOUNT",
    "DUE_AMOUNT"
) AS
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
WHERE sm.due_amount IS NOT NULL AND sm.due_amount <> 0;

-- 
