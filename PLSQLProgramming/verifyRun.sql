
-- TEST PROCEDURES

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
