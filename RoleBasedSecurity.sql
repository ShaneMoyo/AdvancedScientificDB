CREATE ROLE Admin;
CREATE ROLE Researcher;

GRANT SELECT, INSERT, UPDATE, DELETE ON Scientists TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Projects TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Datasets TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Publications TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ProjectDatasets TO Admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON DatasetPublications TO Admin;
GRANT SELECT, INSERT ON AuditLog TO Admin;

GRANT SELECT ON Scientists TO Researcher;
GRANT SELECT ON Projects TO Researcher;
GRANT SELECT, INSERT ON Datasets TO Researcher;
GRANT SELECT ON Publications TO Researcher;

EXEC sp_addrolemember 'Admin', 'User_Alice';  
EXEC sp_addrolemember 'Researcher', 'User_Bob'; 

SELECT * 
FROM sys.database_role_members drm
JOIN sys.database_principals dp ON drm.role_principal_id = dp.principal_id
WHERE dp.name IN ('Admin', 'Researcher');
