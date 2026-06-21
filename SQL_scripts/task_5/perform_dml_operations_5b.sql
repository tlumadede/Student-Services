-- 5(b) SELECT Queries

-- 5(b-i) All students with names starting with a specified letter (e.g. 'M')
SELECT student_id, first_name, last_name
FROM student
WHERE first_name LIKE 'M%';

-- 5(b-ii) Departments located in a given block (e.g. 'Block A')
SELECT department_id, dept_name, block_location
FROM department
WHERE block_location = 'Block A';

-- 5(b-iii) Students in a specified class (e.g. 'CS Year 1A')
SELECT s.student_id, s.first_name, s.last_name
FROM student s
JOIN class c ON s.class_id = c.class_id
WHERE c.class_name = 'CS Year 1A';

-- 5(b-iv) Clubs with no members
SELECT cl.club_id, cl.club_name
FROM club cl
LEFT JOIN club_membership cm ON cl.club_id = cm.club_id
WHERE cm.membership_id IS NULL;