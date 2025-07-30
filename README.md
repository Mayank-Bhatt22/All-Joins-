# All-Joins-
Explained all SQL JOINs with simple examples: INNER, LEFT, RIGHT, FULL (MySQL workaround), CROSS, and SELF JOIN. Includes syntax, use cases, and easy-to-understand logic.
# 🔗 SQL JOINs Explained with Examples

This repo contains clear and practical explanations of all major SQL JOIN types, along with sample queries and use cases. Perfect for beginners and interview prep.

## 📘 What's Inside
- ✅ INNER JOIN
- ✅ LEFT JOIN
- ✅ RIGHT JOIN
- ✅ FULL JOIN (MySQL workaround using UNION)
- ✅ CROSS JOIN
- ✅ SELF JOIN

Each JOIN type includes:
- 📌 Simple explanation
- 🧠 Use case
- 🧾 Syntax example
- ✅ Sample output

## 💡 Example
```sql
SELECT E.EmployeeName, D.DepartmentName
FROM Employee E
LEFT JOIN Department D ON E.DepartmentID = D.DepartmentID;
├── inner_join.sql
├── left_join.sql
├── right_join.sql
├── full_join_union.sql
├── cross_join.sql
├── self_join.sql


---

Let me know if you want me to include **sample tables or diagrams** in this README too!
