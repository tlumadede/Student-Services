# Task 3a — Entities, Attributes, and Relationships
## Student Services Management System (SSMS)

---

### 1. Entity List with Attributes

| # | Entity | Key Attributes |
|---|--------|----------------|
| 1 | **Department** | department_id (PK), dept_name, block_location, hod_id (FK→Lecturer) |
| 2 | **Course** | course_id (PK), course_name, duration_years, department_id (FK) |
| 3 | **Student** | student_id (PK), first_name, last_name, dob, gender, course_id (FK), class_id (FK), enrollment_status, admission_year, phone, email |
| 4 | **Lecturer** | lecturer_id (PK), first_name, last_name, department_id (FK), phone, email |
| 5 | **Subject** | subject_id (PK), subject_name, course_id (FK), lecturer_id (FK), credit_hours |
| 6 | **Class** | class_id (PK), class_name, course_id (FK), year_of_study |
| 7 | **Hostel** | hostel_id (PK), hostel_name, capacity |
| 8 | **Room** | room_id (PK), hostel_id (FK), room_number, capacity |
| 9 | **Hostel_Allocation** | allocation_id (PK), student_id (FK), room_id (FK), term, academic_year |
| 10 | **Club** | club_id (PK), club_name, patron_id (FK→Lecturer), chairperson_id (FK→Student), founded_year |
| 11 | **Club_Membership** | membership_id (PK), club_id (FK), student_id (FK), academic_year, status |
| 12 | **Attachment** | attachment_id (PK), student_id (FK), firm_name, start_date, end_date, status |
| 13 | **Assessment** | assessment_id (PK), student_id (FK), subject_id (FK), term, academic_year, cat_score, exam_score |
| 14 | **Fee_Payment** | payment_id (PK), student_id (FK), term, academic_year, amount_paid, amount_due, payment_date |
| 15 | **User_Account** | user_id (PK), username, password_hash, role (admin/faculty/student), linked_id, status |

### 2. Relationships

| Relationship | Type | Notes |
|---|---|---|
| Department — Course | 1:M | A department offers many courses |
| Department — Lecturer | 1:M | A lecturer belongs to one department |
| Department — Department (HOD) | 1:1 | One lecturer heads one department |
| Course — Class | 1:M | A course has many classes (year groups) |
| Course — Student | 1:M | A student is enrolled in one course |
| Class — Student | 1:M | A class contains many students |
| Course — Subject | 1:M | A course has many subjects |
| Lecturer — Subject | 1:M | A lecturer teaches many subjects |
| Student — Assessment | 1:M | A student has many assessment records |
| Subject — Assessment | 1:M | A subject has many assessment records |
| Hostel — Room | 1:M | A hostel has many rooms |
| Room — Hostel_Allocation | 1:M | A room is allocated to many students over time |
| Student — Hostel_Allocation | 1:M | A student has allocation records over terms |
| Club — Club_Membership | 1:M | A club has many memberships |
| Student — Club_Membership | M:M (via Club_Membership) | A student can join many clubs |
| Lecturer — Club (patron) | 1:M | A lecturer patrons many clubs |
| Student — Club (chairperson) | 1:1 per club | A student chairs at most one club at a time |
| Student — Attachment | 1:M | A student has attachment records over time |
| Student — Fee_Payment | 1:M | A student has many fee payment records |
| User_Account — (Student/Lecturer) | 1:1 | Polymorphic link via role + linked_id |

This satisfies Task 3(a): all entities, attributes, and relationship types (1:1, 1:M, M:M) are identified.
