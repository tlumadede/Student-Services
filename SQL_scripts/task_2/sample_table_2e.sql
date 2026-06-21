CREATE TABLE department (
    department_id   INT PRIMARY KEY AUTO_INCREMENT,
    dept_name       VARCHAR(100) NOT NULL,
    block_location  VARCHAR(50)  NOT NULL,
    hod_id          INT          NULL  
);

DESCRIBE department;

INSERT INTO department (dept_name, block_location, hod_id) VALUES
    ('Computer Science',        'Block A', NULL),
    ('Business Administration', 'Block B', NULL),
    ('Civil Engineering',       'Block C', NULL),
    ('Mathematics & Statistics','Block A', NULL),
    ('Hospitality Management',  'Block D', NULL);

SELECT * FROM department;