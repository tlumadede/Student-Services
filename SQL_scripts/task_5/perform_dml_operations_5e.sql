-- 5(e) Aggregate Queries

-- 5(e-i) Total number of students per course
SELECT co.course_name, COUNT(s.student_id) AS total_students
FROM course co
LEFT JOIN student s ON co.course_id = s.course_id
GROUP BY co.course_id, co.course_name;

-- 5(e-ii) Average grades per department, given term and year
SELECT d.dept_name,
       ROUND(AVG(a.cat_score + a.exam_score), 2) AS avg_total_score
FROM assessment a
JOIN subject sub ON a.subject_id = sub.subject_id
JOIN course co ON sub.course_id = co.course_id
JOIN department d ON co.department_id = d.department_id
WHERE a.term = 'Term 1' AND a.academic_year = 2025
GROUP BY d.dept_name;

-- 5(e-iii) Membership per club per year
SELECT cl.club_name, cm.academic_year, COUNT(cm.student_id) AS members
FROM club cl
JOIN club_membership cm ON cl.club_id = cm.club_id
GROUP BY cl.club_name, cm.academic_year;

-- 5(e-iv) Total marks per subject for a given student, term, year
SELECT sub.subject_name, (a.cat_score + a.exam_score) AS total_marks
FROM assessment a
JOIN subject sub ON a.subject_id = sub.subject_id
WHERE a.student_id = 1 AND a.term = 'Term 1' AND a.academic_year = 2025;

-- 5(e-v) Students currently on attachment/internship per department
SELECT d.dept_name, COUNT(DISTINCT s.student_id) AS students_on_attachment
FROM student s
JOIN course co ON s.course_id = co.course_id
JOIN department d ON co.department_id = d.department_id
JOIN attachment att ON s.student_id = att.student_id
WHERE att.status = 'ongoing'
GROUP BY d.dept_name;

-- 5(e-vi) Attachment completion rates per course
SELECT co.course_name,
    ROUND(100 * SUM(CASE WHEN att.status='completed' THEN 1 ELSE 0 END)
        / COUNT(att.attachment_id), 1) AS completion_rate_pct
FROM attachment att
JOIN student s ON att.student_id = s.student_id
JOIN course co ON s.course_id = co.course_id
GROUP BY co.course_name;

-- 5(e-vii) Hostel occupancy rates by term
SELECT ha.term, ha.academic_year,
    COUNT(ha.allocation_id) AS occupied_slots,
    (SELECT SUM(capacity) FROM room) AS total_capacity,
    ROUND(100 * COUNT(ha.allocation_id) / (SELECT SUM(capacity) FROM room), 1) AS occupancy_pct
FROM hostel_allocation ha
GROUP BY ha.term, ha.academic_year;

-- 5(e-viii) Club participation trends over multiple years
SELECT academic_year, COUNT(*) AS total_memberships
FROM club_membership
GROUP BY academic_year
ORDER BY academic_year;

-- 5(e-ix) Lecturer workload (hours taught per term)
-- Note: "per term" requires a term concept on subject-load; here we
-- approximate using credit_hours per subject taught, which is the
-- standard proxy when subjects aren't separately scheduled by term.
SELECT l.first_name, l.last_name, SUM(s.credit_hours) AS total_hours
FROM lecturer l
JOIN subject s ON l.lecturer_id = s.lecturer_id
GROUP BY l.lecturer_id, l.first_name, l.last_name;
