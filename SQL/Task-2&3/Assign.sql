-- Drop existing objects if any
IF OBJECT_ID('dbo.Staff') IS NOT NULL DROP TABLE dbo.Staff;
IF OBJECT_ID('dbo.Teams') IS NOT NULL DROP TABLE dbo.Teams;

-- Create Teams table
CREATE TABLE Teams (TeamID INT PRIMARY KEY, TeamName VARCHAR(100));

-- Create Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    TeamID INT REFERENCES Teams(TeamID),
    Income DECIMAL(10,2),
    DateJoined DATE
);

-- Insert sample data into Teams
INSERT INTO Teams (TeamID, TeamName) VALUES (101, 'Human Resources'), (102, 'Accounting'), (103, 'Tech Support'), (104, 'Sales and Marketing');

-- Insert sample data into Staff
INSERT INTO Staff (StaffID, First_Name, Last_Name, TeamID, Income, DateJoined) VALUES
(10, 'John', 'Doe', 101, 5000.00, '2020-01-15'),
(11, 'Jane', 'Smith', 102, 6000.00, '2019-03-22'),
(12, 'Michael', 'Johnson', 103, 7000.00, '2018-07-30'),
(13, 'Emily', 'Davis', 104, 5500.00, '2021-11-05');

-- Procedure: Retrieve Staff by Team
IF OBJECT_ID('dbo.GetStaffByTeam') IS NOT NULL DROP PROCEDURE dbo.GetStaffByTeam;
GO
CREATE PROCEDURE GetStaffByTeam @TeamParam INT AS
BEGIN
    SELECT StaffID, First_Name, Last_Name, TeamID, Income, DateJoined FROM Staff WHERE TeamID = @TeamParam;
END;
GO

-- Procedure: Insert a new staff member
IF OBJECT_ID('dbo.AddNewStaff') IS NOT NULL DROP PROCEDURE dbo.AddNewStaff;
GO
CREATE PROCEDURE AddNewStaff @FirstName VARCHAR(50), @LastName VARCHAR(50), @TeamID INT, @Salary DECIMAL(10,2), @JoiningDate DATE AS
BEGIN
    INSERT INTO Staff (First_Name, Last_Name, TeamID, Income, DateJoined) VALUES (@FirstName, @LastName, @TeamID, @Salary, @JoiningDate);
END;
GO

-- Procedure: Count staff in a team
IF OBJECT_ID('dbo.CountTeamMembers') IS NOT NULL DROP PROCEDURE dbo.CountTeamMembers;
GO
CREATE PROCEDURE CountTeamMembers @TeamRef INT AS
BEGIN
    SELECT COUNT(*) AS TotalStaff FROM Staff WHERE TeamID = @TeamRef;
END;
GO

-- Example usage
EXEC CountTeamMembers @TeamRef = 101;
