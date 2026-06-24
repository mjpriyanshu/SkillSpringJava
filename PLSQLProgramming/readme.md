# PL/SQL 

## Step to run and Check the solution
    go to `https://onecompiler.com/oracle`.


## Exercise 1: Control Structures
 ### Scenario 1: Senior Citizen Loan Discount

A PL/SQL block was created to loop through all customers and identify those older than 60 years. For eligible customers, a 1% reduction is applied to their loan interest rate.

### Scenario 2: VIP Customer Promotion

A PL/SQL block was written to iterate through customer records and mark customers as VIP if their account balance exceeds $10,000.

### Scenario 3: Loan Due Reminders

A PL/SQL block was developed to find loans that are due within the next 30 days and display reminder messages for the corresponding customers.

## Exercise 2: Stored Procedures
### Scenario 1: Process Monthly Interest

A stored procedure named ProcessMonthlyInterest was created to automatically apply 1% monthly interest to all savings accounts and update their balances.

### Scenario 2: Employee Bonus Update

A stored procedure named UpdateEmployeeBonus was developed to increase employee salaries by a bonus percentage provided as a parameter for a specific department.

### Scenario 3: Fund Transfer Between Accounts

A stored procedure named TransferFunds was implemented to transfer money from one account to another. The procedure first checks whether the source account has sufficient funds before performing the transfer.

<br>
<br>


# One Liner take-aways from each topic of PL/SQL

| Topic | Key Takeaway |
|-------|--------------|
| **PL/SQL** | Combines SQL with procedural logic (loops, conditions) for complex database operations |
| **Control Structures** | IF-THEN-ELSE, CASE, and loops (FOR, WHILE, LOOP) control program flow |
| **Error Handling** | EXCEPTION block catches errors using predefined or user-defined exceptions |
| **Cursors** | OPEN-FETCH-CLOSE allows row-by-row processing of multi-row query results |
| **Procedures** | Stored actions (no return value) - use IN, OUT, IN OUT parameters |
| **Functions** | Stored calculations (must return a value) - use IN parameters ideally |
| **Packages** | Groups related procedures/functions with public spec and private body |
| **Triggers** | Automatically fire on DML events (BEFORE/AFTER/INSTEAD OF INSERT/UPDATE/DELETE) |