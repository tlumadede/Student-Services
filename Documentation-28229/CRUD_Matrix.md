## Task 3(d): CRUD Matrix

Roles: **Admin (A)**, **Registrar (R)**, **HOD (H)**, **Lecturer (L)**,
**Student (S)**, **Accounts (Ac)**

| Table | Admin | Registrar | HOD | Lecturer | Student | Accounts |
|---|---|---|---|---|---|---|
| department | CRUD | R | R | R | R | R |
| course | CRUD | CRU | R | R | R | - |
| lecturer | CRUD | CRU | R | R(own) | - | - |
| student | CRUD | CRU | R | R(own class) | R(own) | R |
| class | CRUD | CRU | R | R | R(own) | - |
| subject | CRUD | CRU | R | R(own) | R | - |
| assessment | CRUD | R | R | CRU(own subjects) | R(own) | - |
| hostel | CRUD | CRU | R | - | R | - |
| room | CRUD | CRU | R | - | R | - |
| hostel_allocation | CRUD | CRU | R | - | R(own) | - |
| club | CRUD | CRU | R | RU(if patron) | R | - |
| club_membership | CRUD | CRU | R | R | CR(own) | - |
| attachment | CRUD | CRU | R | R | R(own) | - |
| fee_payment | CRUD | R | R | - | R(own) | CRUD |
| user_account | CRUD | R | - | - | - | - |

**Legend:** C=Create, R=Read, U=Update, D=Delete, "-"=No access,
"(own)"=restricted to records linked to that user's identity.

