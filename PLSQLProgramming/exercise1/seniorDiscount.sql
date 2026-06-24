BEGIN
    FOR c IN (SELECT CustomerID, Age FROM Customers) LOOP

        IF c.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = c.CustomerID;
        END IF;

    END LOOP;

    COMMIT;
END;
/