-- 5(d) JOIN Queries

-- 5(d-i) Lecturers and the subjects they teach
SELECT l.first_name, l.last_name, s.subject_name
FROM lecturer l
JOIN subject s ON l.lecturer_id = s.lecturer_id
ORDER BY l.last_name;

-- 5(d-ii) Clubs with their patrons and chairpersons
SELECT
    cl.club_name,
    CONCAT(lp.first_name, ' ', lp.last_name) AS patron,
    CONCAT(st.first_name, ' ', st.last_name) AS chairperson
FROM club cl
LEFT JOIN lecturer lp ON cl.patron_id = lp.lecturer_id
LEFT JOIN student st ON cl.chairperson_id = st.student_id;

-- 5(d-iii) Students in a specific class with their hostel details
SELECT
    s.first_name, s.last_name, c.class_name,
    h.hostel_name, r.room_number
FROM student s
JOIN class c ON s.class_id = c.class_id
LEFT JOIN hostel_allocation ha ON s.student_id = ha.student_id
LEFT JOIN room r ON ha.room_id = r.room_id
LEFT JOIN hostel h ON r.hostel_id = h.hostel_id
WHERE c.class_name = 'CS Year 1A';

-- 5(d-iv) Students attached in the same firm for a specified period
SELECT a1.firm_name, a1.start_date, a1.end_date,
       s1.first_name AS student_1, s2.first_name AS student_2
FROM attachment a1
JOIN attachment a2
    ON a1.firm_name = a2.firm_name
    AND a1.start_date = a2.start_date
    AND a1.student_id < a2.student_id
JOIN student s1 ON a1.student_id = s1.student_id
JOIN student s2 ON a2.student_id = s2.student_id;