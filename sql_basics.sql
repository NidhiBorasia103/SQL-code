DROP TABLE IF EXISTS Employees ;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);	

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES (1, 'John', 'Doe', 1, 60000.00),
(2, 'Jane', 'Smith', 2, 65000.00),
(3, 'Peter', 'Jones', 1, 55000.00);	

UPDATE Employees
SET Salary = 90000, DepartmentID = 3
WHERE EmployeeID = 2;


TRUNCATE TABLE Employees;

SELECT * FROM Employees;
