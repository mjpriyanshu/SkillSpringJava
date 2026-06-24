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