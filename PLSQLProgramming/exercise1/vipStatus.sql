--Solution to Scenario 2: VIP Status

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