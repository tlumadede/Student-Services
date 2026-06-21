-- 1NF: Already achieved (atomic values, no repeating groups)

-- 2NF: Remove partial dependencies
-- Original issue: Student table with course details
-- Solution: Separate Student and Enrollment tables

-- 3NF: Remove transitive dependencies
-- Original: Student table with department_name dependent on course
-- Solution: Keep only department_id, not department_name

-- Final normalized schema:
CREATE TABLE Students (
    student_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1),
    address TEXT,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration INT,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);