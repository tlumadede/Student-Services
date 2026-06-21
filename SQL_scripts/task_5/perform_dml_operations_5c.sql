
-- 5(c) UPDATE and DELETE Operations

-- 5(c-i) Update a user's contact details
SELECT student_id, phone, email FROM student WHERE student_id = 2; -- BEFORE
UPDATE student
SET phone = '0722999999', email = 'fchebet.new@student.ac.ke'
WHERE student_id = 2;
SELECT student_id, phone, email FROM student WHERE student_id = 2; -- AFTER

-- 5(c-ii) Update a student's enrollment status from 'in session' to 'on attachment'
UPDATE student
SET enrollment_status = 'on attachment'
WHERE student_id = 3 AND enrollment_status = 'in session';

SELECT student_id, first_name, last_name, enrollment_status
FROM student WHERE student_id = 3;

-- 5(c-iii) Change a club's chairperson
UPDATE club
SET chairperson_id = 11
WHERE club_id = 1;

SELECT club_id, club_name, chairperson_id FROM club WHERE club_id = 1;

-- 5(c-iv) Deregister clubs with no members for three consecutive years
-- sample data we don't have 3 full years of history, so this query
-- demonstrates the LOGIC using a HAVING clause over years present;
-- adapt year range to your real data once you have 3+ years recorded.
UPDATE club
SET club_name = CONCAT(club_name, ' (DEREGISTERED)')
WHERE club_id IN (
    SELECT club_id FROM (
        SELECT cl.club_id
        FROM club cl
        LEFT JOIN club_membership cm
            ON cl.club_id = cm.club_id
            AND cm.academic_year IN (2023, 2024, 2025)
        GROUP BY cl.club_id
        HAVING COUNT(cm.membership_id) = 0
    ) AS no_members_3yrs
);

SELECT club_id, club_name FROM club;