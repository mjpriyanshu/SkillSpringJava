SET SERVEROUTPUT ON;

-- Create tables
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    age NUMBER,
    balance NUMBER,
    loan_interest_rate NUMBER,
    is_vip VARCHAR2(5) DEFAULT 'FALSE'
);

CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    due_date DATE,
    status VARCHAR2(20)
);

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    account_type VARCHAR2(20),
    balance NUMBER
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department_id NUMBER,
    salary NUMBER
);

-- Insert sample data
INSERT INTO customers VALUES (1, 'John Smith', 65, 5000, 5.5, 'FALSE');
INSERT INTO customers VALUES (2, 'Jane Doe', 45, 15000, 4.0, 'FALSE');
INSERT INTO customers VALUES (3, 'Bob Wilson', 70, 8000, 6.0, 'FALSE');

INSERT INTO loans VALUES (101, 1, SYSDATE + 15, 'ACTIVE');
INSERT INTO loans VALUES (102, 2, SYSDATE + 45, 'ACTIVE');
INSERT INTO loans VALUES (103, 3, SYSDATE + 5, 'ACTIVE');

INSERT INTO accounts VALUES (1001, 1, 'SAVINGS', 5000);
INSERT INTO accounts VALUES (1002, 2, 'CHECKING', 15000);
INSERT INTO accounts VALUES (1003, 3, 'SAVINGS', 8000);

INSERT INTO employees VALUES (1, 'Alice Brown', 10, 50000);
INSERT INTO employees VALUES (2, 'Charlie Davis', 10, 45000);

COMMIT;



-- ============================================
-- SCENARIO 1: Senior Citizen Discount
-- ============================================
DECLARE
    CURSOR c IS SELECT customer_id, age, loan_interest_rate FROM customers;
    v_id customers.customer_id%TYPE;
    v_age customers.age%TYPE;
    v_rate customers.loan_interest_rate%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Scenario 1: Senior Citizen Discount');  
    OPEN c;
    LOOP
        FETCH c INTO v_id, v_age, v_rate;
        EXIT WHEN c%NOTFOUND;
        
        IF v_age > 60 THEN
            UPDATE customers 
            SET loan_interest_rate = loan_interest_rate - 0.01 
            WHERE customer_id = v_id;
            DBMS_OUTPUT.PUT_LINE('Discount applied for Customer: ' || v_id);
        END IF;
    END LOOP;
    CLOSE c;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after scenario
END;
/

-- ============================================
-- SCENARIO 2: VIP Status
-- ============================================
DECLARE
    CURSOR c IS SELECT customer_id, balance FROM customers;
    v_id customers.customer_id%TYPE;
    v_balance customers.balance%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Scenario 2: VIP status');
    OPEN c;
    LOOP
        FETCH c INTO v_id, v_balance;
        EXIT WHEN c%NOTFOUND;
        
        IF v_balance > 10000 THEN
            UPDATE customers SET is_vip = 'TRUE' WHERE customer_id = v_id;
            DBMS_OUTPUT.PUT_LINE('VIP granted: ' || v_id);
        END IF;
    END LOOP;
    CLOSE c;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after scenario
END;
/

-- ============================================
-- SCENARIO 3: Loan Reminders
-- ============================================
DECLARE
    CURSOR c IS 
        SELECT l.loan_id, l.customer_id, l.due_date, c.customer_name
        FROM loans l JOIN customers c ON l.customer_id = c.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;
    
    v_loan_id loans.loan_id%TYPE;
    v_customer_id loans.customer_id%TYPE;
    v_due_date loans.due_date%TYPE;
    v_name customers.customer_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Scenario 3: Loan Reminder');
    OPEN c;
    LOOP
        FETCH c INTO v_loan_id, v_customer_id, v_due_date, v_name;
        EXIT WHEN c%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Reminder: ' || v_name || ' - Loan due on ' || v_due_date);
    END LOOP;
    CLOSE c;
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after scenario
END;
/

-- ============================================
-- PROCEDURE 1: Monthly Interest
-- ============================================
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure 1: Monthly Interest');
    UPDATE accounts SET balance = balance * 1.01 WHERE account_type = 'SAVINGS';
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest applied to all savings accounts.');
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after procedure
END;
/

-- ============================================
-- PROCEDURE 2: Employee Bonus
-- ============================================
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_dept_id IN NUMBER,
    p_bonus_pct IN NUMBER
) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure 2: Employee Bonus');
    UPDATE employees 
    SET salary = salary * (1 + p_bonus_pct/100) 
    WHERE department_id = p_dept_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus applied. Employees updated: ' || SQL%ROWCOUNT);
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after procedure
END;
/

-- ============================================
-- PROCEDURE 3: Transfer Funds
-- ============================================
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from IN NUMBER,
    p_to IN NUMBER,
    p_amount IN NUMBER
) IS
    v_balance NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure 3: Transfer Funds');
    SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from;
    
    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance');
    END IF;
    
    UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from;
    UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Transfer completed: $' || p_amount);
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after procedure
END;
/

-- ============================================
-- TEST PROCEDURES (Using BEGIN..END instead of EXECUTE)
-- ============================================
BEGIN
    ProcessMonthlyInterest;
    UpdateEmployeeBonus(10, 5.0);
    TransferFunds(1001, 1002, 500);
END;
/

-- ============================================
-- VERIFY RESULTS
-- ============================================
SELECT * FROM customers;
SELECT * FROM loans;
SELECT * FROM accounts;
SELECT * FROM employees;