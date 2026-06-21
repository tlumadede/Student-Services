-- some modification 4c

ALTER TABLE student
    ADD COLUMN national_id VARCHAR(20) NULL AFTER email;

DESCRIBE student;

ALTER TABLE lecturer
    MODIFY COLUMN phone VARCHAR(25) NULL;

DESCRIBE lecturer;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE hostel;

SET FOREIGN_KEY_CHECKS = 1;
