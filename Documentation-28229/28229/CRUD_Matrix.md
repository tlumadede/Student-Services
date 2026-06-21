# CRUD Matrix

| Table/Role | Administrator | Faculty (HOD) | Lecturer | Student |
|------------|--------------|---------------|----------|---------|
| **Students | CRUD | R | R | R (own) |
| **Courses | CRUD | CRU | R | R |
| **Departments | CRUD | RU | R | R |
| **Lecturers | CRUD | CRUD | R | R |
| **Subjects | CRUD | CRUD | CRU | R |
| **Enrollment | CRUD | CRU | RU | R (own) |
| **Assessment | CRUD | RU | CRU | R (own) |
| **Club | CRUD | CRU | CRU | CR (join) |
| **ClubMembership | CRUD | R | R | CRUD (own) |
| **Attachment | CRUD | RU | RU | CRU (own) |
