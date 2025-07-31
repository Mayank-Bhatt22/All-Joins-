-- INNER JOIN Questions 

-- 1. Retrieve a list of all employees along with the name of the department they belong to. 
SELECT E.EmployeeID,E.Name,E.DepartmentID,D.DepartmentName,E.ManagerID,E.Salary,E.JoinDate FROM EMPLOYEE AS E INNER JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID;

-- 2. Find the employees who work in the 'Engineering' department. 
SELECT E.EmployeeID,E.Name,E.DepartmentID,D.DepartmentName,E.ManagerID,E.Salary,E.JoinDate FROM EMPLOYEE AS E INNER JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID WHERE D.DepartmentName='Engineering';

-- 3. List the employees and their department names, only for those employees who are assigned to a department.
SELECT E.EmployeeID,E.Name,E.DepartmentID,D.DepartmentName,E.JoinDate FROM EMPLOYEE AS E INNER JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID WHERE D.DepartmentName IS NOT NULL;

-- 4. Retrieve the department names and the count of employees in each department. 
SELECT COUNT(E.EmployeeID) AS Employee_count,D.DepartmentName FROM EMPLOYEE AS E INNER JOIN DEPARTMENT AS D ON E.DepartmentID = D.departmentID GROUP BY DepartmentName;

-- 5. Find the employee names and department names for departments that start with the letter 'F'. 
SELECT E.Name,D.DepartmentName FROM EMPLOYEE AS E INNER JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID WHERE DepartmentName LIKE "F%";

-- LEFT JOIN Questions 

-- 6. List all employees along with their department names, including those who are not assigned to any department. 
SELECT E.Name,D.DepartmentName FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID ;

-- 7. Find all employees who do not belong to any department. 
SELECT E.Name,D.DepartmentName FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT D ON E.DepartmentID=D.departmentID WHERE DepartmentName is null;

-- 8. Retrieve a list of departments and the employees assigned to them, including departments with no employees. 
select DepartmentName, count(EmployeeID) from Employee E left join Department D on E.DepartmentID=D.departmentID GROUP BY DepartmentName;

-- 9. Get the names of employees along with their department names, sorted by department name, including those without a department. 
SELECT E.Name, D.DepartmentName FROM Employee E LEFT JOIN Department D ON E.DepartmentID = D.DepartmentID ORDER BY D.DepartmentName ASC;

-- 10. List all employees and their departments, where the department name is 'Finance'.
SELECT E.EmployeeID,E.Name,E.DepartmentID,D.DepartmentName,E.ManagerID,E.Salary,E.JoinDate FROM Employee E LEFT JOIN Department D ON E.DepartmentID = D.DepartmentID WHERE D.DepartmentName='Finance';

-- RIGHT JOIN Questions

-- 11. Retrieve all departments along with the employees assigned to them, including departments without employees. 
SELECT D.DepartmentName, E.Name FROM Department D RIGHT JOIN Employee E ON D.DepartmentID=E.DepartmentID;

-- 12. Find the names of departments that do not have any employees. 
SELECT D.DepartmentName FROM Employee E RIGHT JOIN Department D ON E.DepartmentID = D.DepartmentID WHERE E.EmployeeID IS NULL;

-- 13. List all department names along with their employees, sorted by department name. 
SELECT E.Name, D.DepartmentName FROM Department D RIGHT JOIN Employee E ON E.DepartmentID = D.DepartmentID ORDER BY D.DepartmentName ASC;

-- 14. Retrieve the names of employees and departments, including employees without a department and departments without employees. 
SELECT E.Name, D.DepartmentName FROM Employee E RIGHT JOIN Department D ON E.DepartmentID = D.DepartmentID;

-- 15. Get a list of departments and the names of their employees, where the employee's name starts with 'A'. 
SELECT E.Name, D.DepartmentName FROM Employee E RIGHT JOIN Department D ON E.DepartmentID = D.DepartmentID where e.name like "A%";

-- FULL JOIN Questions 
-- 16. Retrieve all employees and departments, including those without matches in the other table. 
SELECT E.Name, D.DepartmentName FROM Employee E LEFT JOIN Department D ON E.DepartmentID = D.DepartmentID
UNION
SELECT E.Name, D.DepartmentName FROM Employee E RIGHT JOIN Department D ON E.DepartmentID = D.DepartmentID;

-- 17. Find the departments and employees, showing NULL for unmatched records in both tables. 
SELECT D.DepartmentName, E.Name FROM Department D LEFT JOIN Employee E ON D.DepartmentID = E.DepartmentID
UNION
SELECT D.DepartmentName, E.Name FROM Department D RIGHT JOIN Employee E ON D.DepartmentID = E.DepartmentID;

-- 18. List all department names and employee names, including those without corresponding matches, sorted by department name. 
SELECT D.DepartmentName, E.Name FROM Department D LEFT JOIN Employee E ON D.DepartmentID = E.DepartmentID
UNION
SELECT D.DepartmentName, E.Name FROM Department D RIGHT JOIN Employee E ON D.DepartmentID = E.DepartmentID ORDER BY DepartmentName;

-- 19. Get the names of employees and departments, ensuring that all records from both tables are shown.
SELECT E.Name, D.DepartmentName FROM Employee E LEFT JOIN Department D ON E.DepartmentID = D.DepartmentID
UNION
SELECT E.Name, D.DepartmentName FROM Employee E RIGHT JOIN Department D ON E.DepartmentID = D.DepartmentID;

-- 20. Retrieve a list of all departments and employees, including those without matches, and count the total number of rows returned. 


-- CROSS JOIN Questions 

-- 21. Generate a list of all possible combinations of employees and departments. 
SELECT E.Name, D.DepartmentName FROM Employee E CROSS JOIN Department D;

-- 22. Create a list of employee names and department names, showing every possible combination. 
SELECT E.Name, D.DepartmentName FROM Employee E CROSS JOIN Department D;

-- 23. Find the Cartesian product of the employee and department tables. 


-- 24. List all employees and all departments, ensuring that each employee is matched with every department. 
SELECT E.Name, D.DepartmentName FROM Employee E CROSS JOIN Department D;

-- 25. Create a report showing all possible employee-department pairings.
SELECT E.EmployeeName,D.DepartmentName FROM Employee E CROSS JOIN Department D;



-- SELF JOIN Questions 

-- 26. Retrieve pairs of employees who work in the same department. 
SELECT E1.Name AS Employee1, E2.Name AS Employee2, E1.DepartmentID FROM Employee E1 
JOIN Employee E2 ON E1.DepartmentID = E2.DepartmentID AND E1.EmployeeID < E2.EmployeeID;

-- 27. Find the names of employees along with the names of their colleagues in the same department. 
SELECT E1.Name AS Employee, E2.Name AS Colleague, E1.DepartmentID FROM Employee E1
JOIN Employee E2 ON E1.DepartmentID = E2.DepartmentID AND E1.EmployeeID != E2.EmployeeID;

-- 28. List all employees and their colleagues, ensuring that no employee is paired with themselves. 
SELECT E1.Name AS Employee, E2.Name AS Colleague FROM Employee E1
JOIN Employee E2 ON E1.EmployeeID != E2.EmployeeID;

-- 29. Find employees who work in the same department as 'Alice'. 
SELECT E1.Name FROM Employee E1
JOIN Employee E2 ON E1.DepartmentID = E2.DepartmentID WHERE E2.Name = 'Amit Sharma'AND E1.Name != 'Amit Sharma';

-- 30. Retrieve a list of employee pairs who are in the same department, sorted by department name. 


-- 31. LIST MANAGER PAIR WORKING IN SAME DEPARMENT 
SELECT E1.NAME AS EMPLOYEE_NAME, E2.NAME AS MANAGER, E1.DEPARTMENTID FROM EMPLOYEE E1 JOIN EMPLOYEE E2 ON E1.MANAGERid;

-- 32. FIND EMPloyee WHO REPORT TO A MANAGE IN DEFrent DEPARTMENT 
SELECT E.Name AS Employee, M.Name AS Manager,E.DepartmentID AS EmployeeDept, M.DepartmentID AS ManagerDept
FROM Employee E JOIN Employee M ON E.ManagerID = M.EmployeeID WHERE E.DepartmentID <> M.DepartmentID;

-- 33. LIST WHO HAVE SAME SALARY AS THERE MANAGER 
SELECT E.Name AS Employee, M.Name AS Manager, E.Salary AS EmployeeSalary, M.Salary AS ManagerSalary
FROM Employee E JOIN Employee M ON E.ManagerID = M.EmployeeID WHERE E.Salary = M.Salary;

-- 34. LIST EMP WHOS SALARY IS IS MORE THEN THERE MANAGER
SELECT E.Name AS Employee, M.Name AS Manager, E.Salary AS EmployeeSalary, M.Salary AS ManagerSalary
FROM Employee E JOIN Employee M ON E.ManagerID = M.EmployeeID WHERE E.Salary > M.Salary;

-- 35. LIST EMP AND MANGER WHO HAVE SAME NAME STARES WITH SAME LATER 


-- 36. LIST ALL MANGER WHO DON'T REPORT TO ANY MANAGER  
SELECT DISTINCT M.Name AS Manager FROM Employee E JOIN Employee M ON E.ManagerID = M.EmployeeID
WHERE M.ManagerID IS NULL;


Select * from employee;
Select * from Department;


