-- 4(a) CREATE TABLE statements for all entities
-- 4(b) Constraints applied inline where possible


CREATE TABLE course (
    course_id       INT PRIMARY KEY AUTO_INCREMENT,
    course_name     VARCHAR(100) NOT NULL,
    duration_years  INT NOT NULL,
    department_id   INT NOT NULL,
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id) REFERENCES department(department_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE lecturer (
    lecturer_id    INT PRIMARY KEY AUTO_INCREMENT,
    first_name     VARCHAR(50) NOT NULL,
    last_name      VARCHAR(50) NOT NULL,
    department_id  INT NOT NULL,
    phone          VARCHAR(20),
    email          VARCHAR(100) UNIQUE,
    CONSTRAINT fk_lecturer_department
        FOREIGN KEY (department_id) REFERENCES department(department_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE department
    ADD CONSTRAINT fk_department_hod
    FOREIGN KEY (hod_id) REFERENCES lecturer(lecturer_id)
    ON UPDATE CASCADE ON DELETE SET NULL;

CREATE TABLE class (
    class_id      INT PRIMARY KEY AUTO_INCREMENT,
    class_name    VARCHAR(50) NOT NULL,
    course_id     INT NOT NULL,
    year_of_study INT NOT NULL,
    CONSTRAINT fk_class_course
        FOREIGN KEY (course_id) REFERENCES course(course_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
