-- 6(b) Retrieve Data from Views

SELECT r.student_id, r.first_name, r.last_name, r.course_name, r.admission_year
FROM vw_registrar r
JOIN course co ON r.course_name = co.course_name
WHERE (r.admission_year + co.duration_years) IN (2026, 2028)
  AND r.enrollment_status NOT IN ('deregistered');

-- 6(b-ii) Students with fee balances above 10,000 per department
-- Label: "Figure 35: Students with fee balance > 10,000"
SELECT dept_name, first_name, last_name, term, academic_year, balance
FROM vw_accounts
WHERE balance > 10000
ORDER BY dept_name, balance DESC;

-- 6(b-iii) Departmental examination averages per course, given term/year
-- Label: "Figure 36: Departmental exam averages per course — Term 1 2025"
SELECT dept_name, course_name, avg_score
FROM vw_dean;

-- 6(b-iv) Students in more than one club, descending order of club count
-- Label: "Figure 37: Students in multiple clubs, ranked by club count"
SELECT st.student_id, st.first_name, st.last_name,
       COUNT(cm.club_id) AS club_count
FROM student st
JOIN club_membership cm ON st.student_id = cm.student_id
GROUP BY st.student_id, st.first_name, st.last_name
HAVING COUNT(cm.club_id) > 1
ORDER BY club_count DESC;

-- 6(b-v) Fees collected per department per term per year
-- Label: "Figure 38: Total fees collected by department, term, year"
SELECT dept_name, term, academic_year, SUM(amount_paid) AS total_collected
FROM vw_accounts
GROUP BY dept_name, term, academic_year;

-- 6(b-vi) Students scheduled for supplementary exams at start of term/year
-- Label: "Figure 39: Students flagged for supplementary exams"
SELECT student_id, first_name, last_name, subject_name, term, academic_year, total_score
FROM vw_exam_performance
WHERE result_status = 'Supplementary'
  AND term = 'Term 1' AND academic_year = 2025;

-- 6(b-vii) Number of students on attachment in current term per department
-- Label: "Figure 40: Students currently on attachment, per department"
SELECT d.dept_name, COUNT(DISTINCT s.student_id) AS on_attachment
FROM vw_hod h
JOIN student s ON h.student_id = s.student_id
JOIN course co ON s.course_id = co.course_id
JOIN department d ON co.department_id = d.department_id
WHERE h.enrollment_status = 'on attachment'
GROUP BY d.dept_name;

-- 6(b-viii) Generate a student's transcript for a given term and year
-- Label: "Figure 41: Transcript — Student 1, Term 1 2025"
SELECT first_name, last_name, subject_name, term, academic_year,
       cat_score, exam_score, total_score, result_status
FROM vw_exam_performance
WHERE student_id = 1 AND term = 'Term 1' AND academic_year = 2025;
