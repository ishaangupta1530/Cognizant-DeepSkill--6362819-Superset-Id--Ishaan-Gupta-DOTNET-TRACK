-- Remove existing tables if they already exist to avoid duplication errors
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Creating a table to store department details
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Creating a table to hold employee data with a link to the department
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary DECIMAL(10,2),
    JoinDate DATE
);

-- Populating the Departments table with initial sample records
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

-- Inserting sample employee records into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
(1, 'John', 'Doe', 1, 5000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 2, 6000.00, '2019-03-22'),
(3, 'Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
(4, 'Emily', 'Davis', 4, 5500.00, '2021-11-05');

-- Drop the procedure if it already exists to allow recreation
DROP PROCEDURE IF EXISTS sp_GetEmployeesByDepartment
GO
-- Procedure to fetch employees from a specific department
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate
    FROM Employees
    WHERE DepartmentID = @DepartmentID
END
GO

-- Drop and recreate procedure to add a new employee into the Employees table
DROP PROCEDURE IF EXISTS sp_InsertEmployee
GO
CREATE PROCEDURE sp_InsertEmployee 
    @FirstName VARCHAR(50), 
    @LastName VARCHAR(50), 
    @DepartmentID INT, 
    @Salary DECIMAL(10,2), 
    @JoinDate DATE 
AS 
BEGIN 
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) 
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate); 
END;
GO

-- Remove existing procedure to avoid conflicts before creating a new one
DROP PROCEDURE IF EXISTS GetEmployeeCountByDepartment
GO
-- Procedure to count how many employees are in a particular department
CREATE PROCEDURE GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS EmployeeCount
    FROM Employees
    WHERE DepartmentID = @DepartmentID
END
GO

-- Sample execution to check how many employees belong to Department 1
EXEC GetEmployeeCountByDepartment @DepartmentID = 1;
