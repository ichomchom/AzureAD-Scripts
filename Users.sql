SELECT 
CONCAT(SUBSTRING(EmployeeName, 0, CHARINDEX(',', EmployeeName, 0))
, RIGHT(EmployeeNumber,4)) AS UserName,

SUBSTRING(EmployeeName,CHARINDEX(' ',EmployeeName)+1,LEN(EmployeeName))
AS FirstName,

SUBSTRING(EmployeeName, 0, CHARINDEX(',', EmployeeName, 0))
AS LastName,

Department, Position

FROM Employee
