# Task 2: RDBMS Comparison

| Criterion | MySQL | PostgreSQL | Microsoft SQL Server |
|---|---|---|---|
| **Performance** | Very fast for read-heavy OLTP workloads (typical of a student records system) | Excellent, especially for complex queries and analytics | Excellent, well-optimized but resource-heavy |
| **Scalability** | Good horizontal scaling via replication; widely used at large scale | Strong vertical and horizontal scaling, more advanced clustering | Strong, but scaling often tied to licensing tier |
| **Cost** | Free and open-source (Community Edition) | Free and open-source | Expensive licensing beyond free Express tier (storage/feature limits) |
| **Ease of use** | Very beginner-friendly, huge community, simple setup via XAMPP/Workbench | Slightly steeper learning curve, more advanced features to learn | User-friendly, especially with SSMS GUI, but Windows-centric |
| **Compatibility** | Runs on Windows/Linux/macOS; integrates well with PHP, Python, Java | Runs cross-platform; strong with Python, Java, .NET | Best on Windows Server; cross-platform support newer/less mature |

## Recommendation for the college

**MySQL** is recommended for the Student Services Management System because:
1. It is free, removing licensing cost for a college-budget project.
2. It has the lowest learning curve for a student-built project with a tight
   deadline, with extensive documentation and tooling (MySQL Workbench).
3. Performance is more than sufficient for an institution-scale OLTP system
   (thousands of students, not millions).
4. Wide hosting support if the system is later deployed online (cPanel
   hosting, cloud providers all support MySQL natively).

PostgreSQL would be the runner-up if the college anticipates needing advanced
analytics or stricter data integrity features (e.g. native row-level
security) in the future.
