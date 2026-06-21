-- 1NF: Already achieved (atomic values, no repeating groups)

-- 2NF: Remove partial dependencies
-- Original issue: Student table with course details
-- Solution: Separate Student and Enrollment tables

-- 3NF: Remove transitive dependencies
-- Original: Student table with department_name dependent on course
-- Solution: Keep only department_id, not department_name

-- Departments table
CREATE TABLE Departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(50) NOT NULL,
    hod_name VARCHAR(100) NOT NULL
);

-- Students table
CREATE TABLE Students (
    student_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    enrollment_status VARCHAR(20) DEFAULT 'In Session'
);

-- Courses table
CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_years INT,
    dept_id VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE
);

-- Lecturers table
CREATE TABLE Lecturers (
    lecturer_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dept_id VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Subjects table
CREATE TABLE Subjects (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit_hours INT,
    course_id VARCHAR(10),
    lecturer_id VARCHAR(15),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (lecturer_id) REFERENCES Lecturers(lecturer_id)
);

-- Enrollments table
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(15),
    course_id VARCHAR(10),
    enrollment_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE(student_id, course_id)
);

-- Assessments table
CREATE TABLE Assessments (
    assessment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(15),
    subject_id VARCHAR(10),
    term INT CHECK (term BETWEEN 1 AND 3),
    year INT,
    cat_score DECIMAL(5,2) CHECK (cat_score BETWEEN 0 AND 20),
    exam_score DECIMAL(5,2) CHECK (exam_score BETWEEN 0 AND 60),
    total_marks DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Clubs table
CREATE TABLE Clubs (
    club_id VARCHAR(10) PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    patron_id VARCHAR(15),
    chairperson_id VARCHAR(15),
    established_year INT,
    FOREIGN KEY (patron_id) REFERENCES Lecturers(lecturer_id),
    FOREIGN KEY (chairperson_id) REFERENCES Students(student_id)
);

-- ClubMembership table
CREATE TABLE ClubMembership (
    membership_id SERIAL PRIMARY KEY,
    student_id VARCHAR(15),
    club_id VARCHAR(10),
    join_date DATE,
    year INT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
);

-- Attachments table
CREATE TABLE Attachments (
    attachment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(15),
    firm_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


-- 2. Schema Modifications
-- Add column
ALTER TABLE Students ADD COLUMN registration_date DATE DEFAULT CURRENT_DATE;

-- Change data type
ALTER TABLE Students ALTER COLUMN phone TYPE VARCHAR(20);

-- Export, Drop, Recreate table (example with Departments)
-- Export data to CSV
COPY Departments TO '/tmp/departments_backup.csv' CSV HEADER;

-- Drop table
DROP TABLE Departments CASCADE;

-- Recreate
CREATE TABLE Departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(50) NOT NULL,
    hod_name VARCHAR(100) NOT NULL
);