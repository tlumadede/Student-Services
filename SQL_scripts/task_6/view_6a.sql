-- 6(a) Create role-based views

-- Registrar view: full student academic + enrollment overview
CREATE OR REPLACE VIEW vw_registrar AS
SELECT s.student_id, s.first_name, s.last_name, s.enrollment_status,
       co.course_name, c.class_name, s.admission_year
FROM student s
JOIN course co ON s.course_id = co.course_id
JOIN class c ON s.class_id = c.class_id;

-- HOD view: department-scoped student + staff summary
CREATE OR REPLACE VIEW vw_hod AS
SELECT d.dept_name, co.course_name, s.student_id,
       s.first_name, s.last_name, s.enrollment_status
FROM student s
JOIN course co ON s.course_id = co.course_id
JOIN department d ON co.department_id = d.department_id;

-- Lecturer view: their subjects and enrolled students' assessments
CREATE OR REPLACE VIEW vw_lecturer AS
SELECT l.lecturer_id, l.first_name AS lecturer_first, l.last_name AS lecturer_last,
       sub.subject_name, st.student_id, st.first_name, st.last_name,
       a.term, a.academic_year, a.cat_score, a.exam_score
FROM lecturer l
JOIN subject sub ON l.lecturer_id = sub.lecturer_id
LEFT JOIN assessment a ON sub.subject_id = a.subject_id
LEFT JOIN student st ON a.student_id = st.student_id;

-- Dean view: institution-wide performance summary by department
CREATE OR REPLACE VIEW vw_dean AS
SELECT d.dept_name, co.course_name,
       COUNT(DISTINCT s.student_id) AS total_students,
       ROUND(AVG(a.cat_score + a.exam_score), 2) AS avg_score
FROM department d
JOIN course co ON d.department_id = co.department_id
LEFT JOIN student s ON co.course_id = s.course_id
LEFT JOIN assessment a ON s.student_id = a.student_id
GROUP BY d.dept_name, co.course_name;

-- Exam performance view
CREATE OR REPLACE VIEW vw_exam_performance AS
SELECT st.student_id, st.first_name, st.last_name,
       sub.subject_name, a.term, a.academic_year,
       a.cat_score, a.exam_score,
       (a.cat_score + a.exam_score) AS total_score,
       CASE WHEN (a.cat_score + a.exam_score) < 40 THEN 'Supplementary'
            ELSE 'Pass' END AS result_status
FROM assessment a
JOIN student st ON a.student_id = st.student_id
JOIN subject sub ON a.subject_id = sub.subject_id;

-- Accounts view: fee balances per student per term
CREATE OR REPLACE VIEW vw_accounts AS
SELECT st.student_id, st.first_name, st.last_name,
       d.dept_name, f.term, f.academic_year,
       f.amount_paid, f.amount_due,
       (f.amount_due) AS balance
FROM fee_payment f
JOIN student st ON f.student_id = st.student_id
JOIN course co ON st.course_id = co.course_id
JOIN department d ON co.department_id = d.department_id;

-- Workload view: lecturer hours taught
CREATE OR REPLACE VIEW vw_workload AS
SELECT l.lecturer_id, l.first_name, l.last_name,
       d.dept_name, COUNT(sub.subject_id) AS subjects_taught,
       SUM(sub.credit_hours) AS total_hours
FROM lecturer l
JOIN department d ON l.department_id = d.department_id
JOIN subject sub ON l.lecturer_id = sub.lecturer_id
GROUP BY l.lecturer_id, l.first_name, l.last_name, d.dept_name;

SHOW FULL TABLES WHERE table_type = 'VIEW';

