-- Students (10+ records)
INSERT INTO Students VALUES
('STU001', 'Alice Wanjiku', '2000-05-15', 'F', 'alice@student.edu', '0712345678', 'Nairobi', 'In Session'),
('STU002', 'Bob Omondi', '1999-08-22', 'M', 'bob@student.edu', '0723456789', 'Kisumu', 'In Session'),
('STU003', 'Carol Muthoni', '2001-03-10', 'F', 'carol@student.edu', '0734567890', 'Mombasa', 'In Session'),
('STU004', 'David Kimani', '2000-11-30', 'M', 'david@student.edu', '0745678901', 'Nakuru', 'On Attachment'),
('STU005', 'Eve Njeri', '1999-07-18', 'F', 'eve@student.edu', '0756789012', 'Eldoret', 'In Session'),
('STU006', 'Frank Otieno', '2001-01-25', 'M', 'frank@student.edu', '0767890123', 'Thika', 'In Session'),
('STU007', 'Grace Atieno', '2000-09-12', 'F', 'grace@student.edu', '0778901234', 'Nairobi', 'On Attachment'),
('STU008', 'Henry Njuguna', '1998-12-05', 'M', 'henry@student.edu', '0789012345', 'Kiambu', 'In Session'),
('STU009', 'Irene Wairimu', '2001-06-28', 'F', 'irene@student.edu', '0790123456', 'Nyeri', 'In Session'),
('STU010', 'James Mwangi', '2000-04-17', 'M', 'james@student.edu', '0701234567', 'Machakos', 'In Session');

-- Departments ()

-- Courses
INSERT INTO Courses VALUES
('CSC01', 'BSc Computer Science', 4, 'CSC'),
('EEE01', 'BSc Electrical Eng', 5, 'EEE'),
('MEC01', 'BSc Mechanical Eng', 5, 'MEC'),
('BUS01', 'BCom Finance', 4, 'BUS'),
('CIV01', 'BSc Civil Eng', 5, 'CIV');

-- Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date, status) VALUES
('STU001', 'CSC01', '2022-09-01', 'Active'),
('STU002', 'CSC01', '2022-09-01', 'Active'),
('STU003', 'BUS01', '2022-09-01', 'Active'),
('STU004', 'EEE01', '2021-09-01', 'Active'),
('STU005', 'MEC01', '2022-09-01', 'Active'),
('STU006', 'CSC01', '2023-01-15', 'Active'),
('STU007', 'BUS01', '2022-09-01', 'Active'),
('STU008', 'CIV01', '2021-09-01', 'Active'),
('STU009', 'EEE01', '2022-09-01', 'Active'),
('STU010', 'MEC01', '2023-01-15', 'Active');

-- SELECT Queries
-- i) Students with names starting with 'A'
SELECT * FROM Students WHERE name LIKE 'A%';

-- ii) Departments in Block A
SELECT * FROM Departments WHERE location = 'Block A';

-- iii) Students in a specific class (course)
SELECT s.* FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 'CSC01';

-- iv) Clubs with no members (assuming Clubs table has data)
SELECT c.club_name FROM Clubs c
LEFT JOIN ClubMembership cm ON c.club_id = cm.club_id
WHERE cm.membership_id IS NULL;

-- UPDATE operations
-- i) Update contact details
UPDATE Students SET phone = '0711111111', email = 'alice.new@student.edu' 
WHERE student_id = 'STU001';

-- ii) Update enrollment status
UPDATE Students SET enrollment_status = 'On Attachment' 
WHERE student_id = 'STU004';

-- JOIN Queries
-- i) Lecturers and subjects they teach
SELECT l.name AS lecturer_name, s.subject_name 
FROM Lecturers l
JOIN Subjects s ON l.lecturer_id = s.lecturer_id;

-- Aggregate Functions
-- i) Total students per course
SELECT c.course_name, COUNT(e.student_id) as student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- v) Students currently on attachment
SELECT s.name, a.firm_name, a.start_date, a.end_date
FROM Students s
JOIN Attachments a ON s.student_id = a.student_id
WHERE a.status = 'Active' AND CURRENT_DATE BETWEEN a.start_date AND a.end_date;