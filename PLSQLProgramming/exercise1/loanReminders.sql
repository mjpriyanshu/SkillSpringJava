-- Solution to Scenario 3: Loan Reminders

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