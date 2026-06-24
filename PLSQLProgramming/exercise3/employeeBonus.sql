-- PROCEDURE 2: Employee Bonus

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