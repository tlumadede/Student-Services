-- Create Views for different roles
-- Registrar view
CREATE VIEW registrar_view AS
SELECT s.*, c.course_name, e.enrollment_date, e.status as enrollment_status
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- HOD view
CREATE VIEW hod_view AS
SELECT d.dept_name, l.name as lecturer_name, COUNT(s.subject_id) as subjects_taught
FROM Departments d
JOIN Lecturers l ON d.dept_id = l.dept_id
JOIN Subjects s ON l.lecturer_id = s.lecturer_id
GROUP BY d.dept_name, l.name;

-- Lecturer view
CREATE VIEW lecturer_view AS
SELECT s.subject_name, COUNT(a.student_id) as student_count,
       AVG(a.total_marks) as average_score
FROM Subjects s
LEFT JOIN Assessments a ON s.subject_id = a.subject_id
GROUP BY s.subject_name;

-- Student view (own data)
CREATE VIEW student_view AS
SELECT s.*, c.course_name, 
       a.term, a.year, a.total_marks,
       cl.club_name, at.firm_name as attachment_firm
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id
LEFT JOIN Assessments a ON s.student_id = a.student_id
LEFT JOIN ClubMembership cm ON s.student_id = cm.student_id
LEFT JOIN Clubs cl ON cm.club_id = cl.club_id
LEFT JOIN Attachments at ON s.student_id = at.student_id;

-- Queries using views
-- i) Students due for graduation (every 2 years)
SELECT * FROM registrar_view 
WHERE EXTRACT(YEAR FROM enrollment_date) % 2 = 0;

-- ii) Students with fee balances > 10,000 (assuming fees table)
-- Create fees table first
CREATE TABLE Fees (
    fee_id SERIAL PRIMARY KEY,
    student_id VARCHAR(15),
    amount_due DECIMAL(10,2),
    amount_paid DECIMAL(10,2),
    balance DECIMAL(10,2)
);

CREATE VIEW fee_balance_view AS
SELECT s.name, s.student_id, d.dept_name, f.balance
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Departments d ON c.dept_id = d.dept_id
JOIN Fees f ON s.student_id = f.student_id
WHERE f.balance > 10000;

-- Update, Drop, Recreate View
-- Update exam performance view
CREATE OR REPLACE VIEW exam_performance AS
SELECT student_id, subject_id, term, year,
       cat_score, exam_score, total_marks,
       CASE WHEN total_marks < 40 THEN 'Supplementary' ELSE 'Pass' END as exam_status
FROM Assessments;

-- Drop view
DROP VIEW IF EXISTS exam_performance;

-- Recreate with modifications
CREATE VIEW exam_performance AS
SELECT student_id, subject_id, term, year,
       cat_score, exam_score, total_marks,
       CASE 
           WHEN total_marks < 40 AND exam_score < 30 THEN 'Supplementary'
           WHEN total_marks >= 40 THEN 'Pass'
           ELSE 'Fail'
       END as exam_status
FROM Assessments;