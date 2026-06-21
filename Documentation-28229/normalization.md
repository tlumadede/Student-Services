# Task 3c — Normalization & Task 3d — CRUD Matrix


## Task 3(c): Normalization to 3NF

**1NF (atomic values, no repeating groups):**
All attributes hold single, indivisible values. Originally a naive design might
store a student's clubs as a comma-separated list in the student row
(`clubs: "Debate Club, Chess Club"`) — this violates 1NF. Resolved by creating
a separate `club_membership` table.

**2NF (no partial dependency on a composite key):**
The `assessment` table's natural composite key would be
(student_id, subject_id, term, academic_year). All non-key attributes
(cat_score, exam_score) depend on the *whole* composite, not a subset — so
2NF holds once `assessment_id` is introduced as a surrogate key with a
UNIQUE constraint enforcing the composite uniqueness (see Task 4).
Similarly, `club_membership` and `hostel_allocation` use surrogate keys with
UNIQUE composites for the same reason.

**3NF (no transitive dependency on a non-key attribute):**
- Originally, `student` might have included `dept_name` directly (since a
  student's department is derivable through their course). This is a
  transitive dependency: `student_id → course_id → department_id → dept_name`.
  Resolved by NOT storing department on student at all — it's derived via
  JOIN through `course`.
- Similarly, `lecturer` does not store `dept_name`, only `department_id`.
- `assessment` does not store `subject_name` or `student_name` — only the
  foreign keys, with names looked up via JOIN.

**Result:** every non-key attribute in every table depends only on that
table's own primary key, satisfying 3NF.

---


