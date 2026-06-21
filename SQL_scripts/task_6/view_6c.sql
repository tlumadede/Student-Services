-- 6(c) Update, Drop, and Recreate a View

CREATE OR REPLACE VIEW vw_exam_performance AS
SELECT st.student_id, st.first_name, st.last_name,
       sub.subject_name, a.term, a.academic_year,
       a.cat_score, a.exam_score,
       (a.cat_score + a.exam_score) AS total_score,
       CASE WHEN (a.cat_score + a.exam_score) < 40 THEN 'Supplementary'
            ELSE 'Pass' END AS result_status,
       CASE WHEN (a.cat_score + a.exam_score) < 40 THEN 'Supplementary Exam'
            ELSE 'Regular Exam' END AS attempt_type
FROM assessment a
JOIN student st ON a.student_id = st.student_id
JOIN subject sub ON a.subject_id = sub.subject_id;

SELECT * FROM vw_exam_performance LIMIT 10;

-- 6(c-ii) Drop the view
DROP VIEW vw_exam_performance;

-- 6(c-iii) Recreate the view
CREATE VIEW vw_exam_performance AS
SELECT st.student_id, st.first_name, st.last_name,
       sub.subject_name, a.term, a.academic_year,
       a.cat_score, a.exam_score,
       (a.cat_score + a.exam_score) AS total_score,
       CASE WHEN (a.cat_score + a.exam_score) < 40 THEN 'Supplementary'
            ELSE 'Pass' END AS result_status,
       CASE WHEN (a.cat_score + a.exam_score) < 40 THEN 'Supplementary Exam'
            ELSE 'Regular Exam' END AS attempt_type
FROM assessment a
JOIN student st ON a.student_id = st.student_id
JOIN subject sub ON a.subject_id = sub.subject_id;

SELECT * FROM vw_exam_performance LIMIT 5;
