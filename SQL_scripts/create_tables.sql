-- Creates Table

CREATE TABLE Departments(
DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR(100) NOT NULL,
LocationBlock VARCHAR(50) NOT NULL,
HeadOfDepartment VARCHAR(100) NOT NULL
);

-- Creates Users

CREATE USER 'admin'@'localhost'
IDENTIFIED BY 'Admin';

CREATE USER 'faculty'@'localhost'
IDENTIFIED BY 'Faculty';

CREATE USER 'student'@'localhost'
IDENTIFIED BY 'Student';

-- Grants Privileges

GRANT ALL PRIVILEGES
ON StudentServicesDB.*
TO 'admin'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON StudentServicesDB.*
TO 'faculty'@'localhost';

GRANT SELECT
ON StudentServicesDB.*
TO 'student'@'localhost';

FLUSH PRIVILEGES;