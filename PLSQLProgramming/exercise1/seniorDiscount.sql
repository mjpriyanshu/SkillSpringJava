-- Solution to Scenario 1: Senior Citizen Discount

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