CREATE TABLE student (
    student_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name        VARCHAR(50) NOT NULL,
    last_name         VARCHAR(50) NOT NULL,
    dob               DATE NOT NULL,
    gender            VARCHAR(10) NOT NULL,
    course_id         INT NOT NULL,
    class_id          INT NOT NULL,
    enrollment_status VARCHAR(20) NOT NULL DEFAULT 'in session',
    admission_year    INT NOT NULL,
    phone             VARCHAR(20),
    email             VARCHAR(100) UNIQUE,
    CONSTRAINT fk_student_course
        FOREIGN KEY (course_id) REFERENCES course(course_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_student_class
        FOREIGN KEY (class_id) REFERENCES class(class_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_student_gender
        CHECK (gender IN ('Male', 'Female')),
    CONSTRAINT uq_student_name_dob
        UNIQUE (first_name, last_name, dob)
);

CREATE TABLE subject (
    subject_id     INT PRIMARY KEY AUTO_INCREMENT,
    subject_name   VARCHAR(100) NOT NULL,
    course_id      INT NOT NULL,
    lecturer_id    INT NOT NULL,
    credit_hours   INT NOT NULL DEFAULT 3,
    CONSTRAINT fk_subject_course
        FOREIGN KEY (course_id) REFERENCES course(course_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_subject_lecturer
        FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE assessment (
    assessment_id  INT PRIMARY KEY AUTO_INCREMENT,
    student_id     INT NOT NULL,
    subject_id     INT NOT NULL,
    term           VARCHAR(20) NOT NULL,
    academic_year  INT NOT NULL,
    cat_score      DECIMAL(4,1) NOT NULL DEFAULT 0,
    exam_score     DECIMAL(4,1) NOT NULL DEFAULT 0,
    CONSTRAINT fk_assessment_student
        FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_assessment_subject
        FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_cat_score
        CHECK (cat_score BETWEEN 0 AND 20),
    CONSTRAINT chk_exam_score
        CHECK (exam_score BETWEEN 0 AND 60),
    CONSTRAINT uq_assessment_record
        UNIQUE (student_id, subject_id, term, academic_year)
);

CREATE TABLE hostel (
    hostel_id   INT PRIMARY KEY AUTO_INCREMENT,
    hostel_name VARCHAR(50) NOT NULL,
    capacity    INT NOT NULL
);

CREATE TABLE room (
    room_id     INT PRIMARY KEY AUTO_INCREMENT,
    hostel_id   INT NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    capacity    INT NOT NULL DEFAULT 4,
    CONSTRAINT fk_room_hostel
        FOREIGN KEY (hostel_id) REFERENCES hostel(hostel_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT uq_room_per_hostel
        UNIQUE (hostel_id, room_number)
);

CREATE TABLE hostel_allocation (
    allocation_id  INT PRIMARY KEY AUTO_INCREMENT,
    student_id     INT NOT NULL,
    room_id        INT NOT NULL,
    term           VARCHAR(20) NOT NULL,
    academic_year  INT NOT NULL,
    CONSTRAINT fk_allocation_student
        FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_allocation_room
        FOREIGN KEY (room_id) REFERENCES room(room_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE club (
    club_id        INT PRIMARY KEY AUTO_INCREMENT,
    club_name      VARCHAR(100) NOT NULL UNIQUE,
    patron_id      INT NULL,
    chairperson_id INT NULL,
    founded_year   INT,
    CONSTRAINT fk_club_patron
        FOREIGN KEY (patron_id) REFERENCES lecturer(lecturer_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_club_chairperson
        FOREIGN KEY (chairperson_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE club_membership (
    membership_id  INT PRIMARY KEY AUTO_INCREMENT,
    club_id        INT NOT NULL,
    student_id     INT NOT NULL,
    academic_year  INT NOT NULL,
    status         VARCHAR(20) NOT NULL DEFAULT 'active',
    CONSTRAINT fk_membership_club
        FOREIGN KEY (club_id) REFERENCES club(club_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_membership_student
        FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT uq_membership UNIQUE (club_id, student_id, academic_year)
);

CREATE TABLE attachment (
    attachment_id  INT PRIMARY KEY AUTO_INCREMENT,
    student_id     INT NOT NULL,
    firm_name      VARCHAR(100) NOT NULL,
    start_date     DATE NOT NULL,
    end_date       DATE NOT NULL,
    status         VARCHAR(20) NOT NULL DEFAULT 'ongoing',
    CONSTRAINT fk_attachment_student
        FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_attachment_dates
        CHECK (end_date >= start_date)
);

CREATE TABLE fee_payment (
    payment_id     INT PRIMARY KEY AUTO_INCREMENT,
    student_id     INT NOT NULL,
    term           VARCHAR(20) NOT NULL,
    academic_year  INT NOT NULL,
    amount_paid    DECIMAL(10,2) NOT NULL DEFAULT 0,
    amount_due     DECIMAL(10,2) NOT NULL DEFAULT 0,
    payment_date   DATE,
    CONSTRAINT fk_payment_student
        FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE user_account (
    user_id       INT PRIMARY KEY AUTO_INCREMENT,
    username      VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role          VARCHAR(20) NOT NULL,
    linked_id     INT NOT NULL,
    status        VARCHAR(20) NOT NULL DEFAULT 'active',
    CONSTRAINT chk_user_role
        CHECK (role IN ('admin', 'faculty', 'student'))
);

SHOW TABLES;