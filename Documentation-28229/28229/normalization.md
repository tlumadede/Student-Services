# Normalization

1NF: All attributes are atomic (e.g., split student_name into first_name/last_name; no repeating groups like multiple subjects in one field — hence the separate Assessment table instead of columns per subject).

2NF: Removed partial dependencies — e.g., in a hypothetical combined "Enrollment" table, course_name depended only on course_id, not the full key, so Course was split into its own table.

3NF: Removed transitive dependencies — e.g., head_of_department depends on department_id, not on student_id, so it lives in Department, not duplicated in Student.