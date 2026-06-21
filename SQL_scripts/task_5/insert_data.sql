-- TASK 5: PERFORM DML OPERATIONS
-- Insert Test Data (5a)

CREATE TABLE IF NOT EXISTS hostel (
    hostel_id   INT PRIMARY KEY AUTO_INCREMENT,
    hostel_name VARCHAR(50) NOT NULL,
    capacity    INT NOT NULL
);

-- Courses (depends on department)
INSERT INTO course (course_name, duration_years, department_id) VALUES
    ('BSc Computer Science', 4, 1),
    ('Diploma in Information Technology', 3, 1),
    ('BCom Business Administration', 4, 2),
    ('Diploma in Procurement', 3, 2),
    ('BSc Civil Engineering', 5, 3),
    ('Diploma in Building Technology', 3, 3),
    ('BSc Mathematics', 4, 4),
    ('BSc Actuarial Science', 4, 4),
    ('Diploma in Hospitality Management', 3, 5),
    ('Certificate in Food & Beverage', 1, 5);

-- Lecturers (depends on department)
INSERT INTO lecturer (first_name, last_name, department_id, phone, email) VALUES
    ('Wanjiru', 'Kamau',   1, '0711000001', 'wkamau@college.ac.ke'),
    ('Otieno',  'Owino',   1, '0711000002', 'oowino@college.ac.ke'),
    ('Mutua',   'Kioko',   2, '0711000003', 'mkioko@college.ac.ke'),
    ('Achieng', 'Odhiambo',2, '0711000004', 'aodhiambo@college.ac.ke'),
    ('Kiprop',  'Ruto',    3, '0711000005', 'kruto@college.ac.ke'),
    ('Naliaka', 'Wafula',  3, '0711000006', 'nwafula@college.ac.ke'),
    ('Chebet',  'Korir',   4, '0711000007', 'ckorir@college.ac.ke'),
    ('Wambui',  'Njoroge', 4, '0711000008', 'wnjoroge@college.ac.ke'),
    ('Hassan',  'Ali',     5, '0711000009', 'hali@college.ac.ke'),
    ('Atieno',  'Omolo',   5, '0711000010', 'aomolo@college.ac.ke');

-- Assign Heads of Department now that lecturers exist
UPDATE department SET hod_id = 1 WHERE department_id = 1;
UPDATE department SET hod_id = 3 WHERE department_id = 2;
UPDATE department SET hod_id = 5 WHERE department_id = 3;
UPDATE department SET hod_id = 7 WHERE department_id = 4;
UPDATE department SET hod_id = 9 WHERE department_id = 5;

-- Classes (depends on course)
INSERT INTO class (class_name, course_id, year_of_study) VALUES
    ('CS Year 1A', 1, 1), ('CS Year 2A', 1, 2),
    ('IT Year 1A', 2, 1), ('BCOM Year 1A', 3, 1),
    ('BCOM Year 2A', 3, 2), ('PROC Year 1A', 4, 1),
    ('CIVIL Year 1A', 5, 1), ('CIVIL Year 3A', 5, 3),
    ('MATH Year 1A', 7, 1), ('HOSP Year 1A', 9, 1);

-- Students (depends on course, class)
INSERT INTO student (first_name, last_name, dob, gender, course_id, class_id, enrollment_status, admission_year, phone, email) VALUES
    ('Brian',   'Mwangi',  '2003-04-12', 'Male',   1, 1, 'in session', 2023, '0722000001', 'bmwangi@student.ac.ke'),
    ('Faith',   'Chebet',  '2002-11-03', 'Female', 1, 2, 'in session', 2022, '0722000002', 'fchebet@student.ac.ke'),
    ('Kevin',   'Otieno',  '2003-07-21', 'Male',   2, 3, 'in session', 2024, '0722000003', 'kotieno@student.ac.ke'),
    ('Mercy',   'Wanjiku', '2002-02-15', 'Female', 3, 4, 'in session', 2023, '0722000004', 'mwanjiku@student.ac.ke'),
    ('Dennis',  'Kiprotich','2001-09-09','Male',   3, 5, 'on attachment', 2022, '0722000005', 'dkiprotich@student.ac.ke'),
    ('Aisha',   'Mohamed', '2003-01-27', 'Female', 4, 6, 'in session', 2024, '0722000006', 'amohamed@student.ac.ke'),
    ('Peter',   'Njoroge', '2000-12-05', 'Male',   5, 7, 'in session', 2021, '0722000007', 'pnjoroge@student.ac.ke'),
    ('Grace',   'Akinyi',  '2000-06-18', 'Female', 5, 8, 'on attachment', 2021, '0722000008', 'gakinyi@student.ac.ke'),
    ('Samuel',  'Kamau',   '2003-03-30', 'Male',   7, 9, 'in session', 2024, '0722000009', 'skamau@student.ac.ke'),
    ('Lucy',    'Naliaka', '2002-08-14', 'Female', 9, 10,'in session', 2023, '0722000010', 'lnaliaka@student.ac.ke'),
    ('Joseph',  'Omondi',  '2003-05-22', 'Male',   1, 1, 'in session', 2023, '0722000011', 'jomondi@student.ac.ke'),
    ('Esther',  'Wairimu', '2002-10-10', 'Female', 1, 2, 'deregistered',2022,'0722000012', 'ewairimu@student.ac.ke');

-- Subjects (depends on course, lecturer)
INSERT INTO subject (subject_name, course_id, lecturer_id, credit_hours) VALUES
    ('Database Systems',      1, 1, 3),
    ('Data Structures',       1, 2, 3),
    ('Web Development',       2, 2, 3),
    ('Principles of Marketing',3,3, 3),
    ('Financial Accounting',  3, 4, 3),
    ('Procurement Law',       4, 4, 2),
    ('Structural Analysis',   5, 5, 4),
    ('Surveying',             5, 6, 3),
    ('Calculus II',           7, 7, 3),
    ('Food Production',       9, 9, 3);

-- Assessments (depends on student, subject) — 10 + records
INSERT INTO assessment (student_id, subject_id, term, academic_year, cat_score, exam_score) VALUES
    (1, 1, 'Term 1', 2025, 18, 52),
    (1, 2, 'Term 1', 2025, 15, 48),
    (2, 1, 'Term 1', 2025, 12, 40),
    (3, 3, 'Term 1', 2025, 16, 50),
    (4, 4, 'Term 1', 2025, 19, 55),
    (4, 5, 'Term 1', 2025, 14, 44),
    (6, 6, 'Term 1', 2025, 17, 53),
    (7, 7, 'Term 1', 2025, 13, 38),
    (9, 9, 'Term 1', 2025, 20, 58),
    (10,9, 'Term 1', 2025, 9,  22),
    (11,1, 'Term 1', 2025, 16, 49),
    (1, 1, 'Term 2', 2025, 17, 51);

-- Hostels
INSERT INTO hostel (hostel_name, capacity) VALUES
    ('Hostel A', 200), ('Hostel B', 150), ('Hostel C', 180);

-- Rooms (depends on hostel)
INSERT INTO room (hostel_id, room_number, capacity) VALUES
    (1,'A-101',4),(1,'A-102',4),(1,'A-103',4),
    (2,'B-201',4),(2,'B-202',4),(2,'B-203',4),
    (3,'C-301',4),(3,'C-302',4),(3,'C-303',4),(3,'C-304',4);

-- Hostel allocations (depends on student, room)
INSERT INTO hostel_allocation (student_id, room_id, term, academic_year) VALUES
    (1,1,'Term 1',2025),(2,1,'Term 1',2025),(3,4,'Term 1',2025),
    (4,4,'Term 1',2025),(6,7,'Term 1',2025),(9,2,'Term 1',2025),
    (10,8,'Term 1',2025),(11,1,'Term 1',2025),(1,1,'Term 2',2025),
    (3,4,'Term 2',2025);

-- Clubs (depends on lecturer for patron, student for chairperson)
INSERT INTO club (club_name, patron_id, chairperson_id, founded_year) VALUES
    ('Debate Club',        1, 1,  2018),
    ('Tech Innovators',    2, 3,  2020),
    ('Drama Club',         3, 4,  2015),
    ('Football Club',      5, 7,  2010),
    ('Christian Union',    9, 9,  2012),
    ('Photography Club',   6, NULL, 2021),
    ('Chess Club',         7, NULL, 2022);

-- Club memberships (depends on club, student)
INSERT INTO club_membership (club_id, student_id, academic_year, status) VALUES
    (1,1,2025,'active'),(1,2,2025,'active'),(2,3,2025,'active'),
    (2,1,2025,'active'),(3,4,2025,'active'),(4,7,2025,'active'),
    (4,8,2025,'active'),(5,9,2025,'active'),(1,11,2025,'active'),
    (3,6,2025,'active'),(2,10,2025,'active');

-- Attachments (depends on student)
INSERT INTO attachment (student_id, firm_name, start_date, end_date, status) VALUES
    (5, 'Safaricom PLC',        '2025-05-01','2025-08-31','ongoing'),
    (8, 'Kenya Pipeline Co.',   '2025-05-01','2025-08-31','ongoing'),
    (1, 'KCB Bank',             '2024-05-01','2024-08-31','completed'),
    (4, 'Deloitte East Africa', '2024-05-01','2024-08-31','completed'),
    (7, 'China Wu Yi (Kenya)',  '2024-01-01','2024-04-30','completed'),
    (9, 'KEMRI',                '2024-09-01','2024-12-31','completed'),
    (2, 'Equity Bank',          '2025-01-01','2025-04-30','completed'),
    (10,'Sarova Hotels',        '2025-01-01','2025-04-30','completed'),
    (3, 'Microsoft ADC',        '2025-05-01','2025-08-31','ongoing'),
    (11,'Jumia Kenya',          '2024-09-01','2024-12-31','completed');

-- Fee payments (depends on student)
INSERT INTO fee_payment (student_id, term, academic_year, amount_paid, amount_due, payment_date) VALUES
    (1,'Term 1',2025, 45000, 0,     '2025-01-15'),
    (2,'Term 1',2025, 30000, 15000, '2025-01-20'),
    (3,'Term 1',2025, 40000, 5000,  '2025-01-18'),
    (4,'Term 1',2025, 50000, 0,     '2025-01-10'),
    (5,'Term 1',2025, 20000, 25000, '2025-01-22'),
    (6,'Term 1',2025, 45000, 0,     '2025-01-12'),
    (7,'Term 1',2025, 35000, 12000, '2025-01-25'),
    (8,'Term 1',2025, 42000, 0,     '2025-01-14'),
    (9,'Term 1',2025, 38000, 11000, '2025-01-19'),
    (10,'Term 1',2025,46000, 0,     '2025-01-11'),
    (11,'Term 1',2025,15000, 30000, '2025-02-01'),
    (1,'Term 2',2025, 45000, 0,     '2025-05-15');

-- Verify row counts
SELECT 'department' AS tbl, COUNT(*) AS row_count FROM department
UNION ALL SELECT 'course', COUNT(*) FROM course
UNION ALL SELECT 'lecturer', COUNT(*) FROM lecturer
UNION ALL SELECT 'student', COUNT(*) FROM student
UNION ALL SELECT 'subject', COUNT(*) FROM subject
UNION ALL SELECT 'assessment', COUNT(*) FROM assessment
UNION ALL SELECT 'hostel_allocation', COUNT(*) FROM hostel_allocation
UNION ALL SELECT 'club_membership', COUNT(*) FROM club_membership
UNION ALL SELECT 'attachment', COUNT(*) FROM attachment
UNION ALL SELECT 'fee_payment', COUNT(*) FROM fee_payment;
