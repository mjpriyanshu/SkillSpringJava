BEGIN
    FOR l IN (
        SELECT CustomerID, DueDate
        FROM Loans
        WHERE DueDate <= SYSDATE + 30
    ) LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan due for Customer '
            || l.CustomerID
        );

    END LOOP;
END;
/