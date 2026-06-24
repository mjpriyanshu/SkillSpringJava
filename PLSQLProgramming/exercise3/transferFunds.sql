-- PROCEDURE 3: Transfer Funds

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