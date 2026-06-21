# Entities and Relationships

## Entities (10 main entities):
1. **Student - student_id(PK), name, dob, gender, address, phone, email, enrollment_status
2. **Course - course_id(PK), course_name, duration, department_id(FK)
3. **Department- department_id(PK), name, location, hod
4. **Lecturer - lecturer_id(PK), name, email, phone, department_id(FK)
5. **Subject - subject_id(PK), subject_name, credit_hours, course_id(FK), lecturer_id(FK)
6. **Enrollment - enrollment_id(PK), student_id(FK), course_id(FK), enrollment_date, status
7. **Assessment - assessment_id(PK), student_id(FK), subject_id(FK), term, year, cat_score, exam_score, total_marks
8. **Club - club_id(PK), club_name, patron_id(FK), chairperson_id(FK)
9. **ClubMembership - membership_id(PK), student_id(FK), club_id(FK), join_date, year
10. **Attachment - attachment_id(PK), student_id(FK), firm_name, start_date, end_date, status

## Relationships:
- Department 1---* Lecturer (One department has many lecturers)
- Department 1---* Course (One department offers many courses)
- Course 1---* Subject (One course has many subjects)
- Course 1---* Student (One course has many students)
- Lecturer 1---* Subject (One lecturer teaches many subjects)
- Student *---* Club (through ClubMembership)
- Student 1---* Assessment (One student has many assessments)
- Student 1---* Attachment (One student can have multiple attachments)