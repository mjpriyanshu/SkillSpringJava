-- PROCEDURE 1: Monthly Interest

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure 1: Monthly Interest');
    UPDATE accounts SET balance = balance * 1.01 WHERE account_type = 'SAVINGS';
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Interest applied to all savings accounts.');
    DBMS_OUTPUT.PUT_LINE(CHR(10));  -- Blank line after procedure
END;
/