CREATE VIEW EmployeeManagementLevel 
AS
WITH Management AS
(SELECT Boss.EmployeeNumber, Boss.EmployeeName, Boss.Position, Boss.ManagerEmployeeNumber, 1 AS ManagementLevel, Boss.DATETERMINATION
FROM Employee AS Boss
WHERE Boss.ManagerEmployeeNumber IS NULL

UNION ALL

SELECT Emp.EmployeeNumber, Emp.EmployeeName, Emp.Position, Emp.ManagerEmployeeNumber, ManagementLevel + 1, Emp.DATETERMINATION
FROM Employee AS Emp

INNER JOIN Management AS Mng

ON Emp.ManagerEmployeeNumber = Mng.EmployeeNumber
WHERE Emp.ManagerEmployeeNumber IS NOT NULL AND Emp.DATETERMINATION IS NULL)

SELECT EmployeeNumber, EmployeeName, Position, ManagerEmployeeNumber, ManagementLevel
FROM Management 

SELECT * FROM Management ORDER BY ManagementLevel
