CREATE TABLE AuditLog (
    LogID INT IDENTITY PRIMARY KEY,
    TableName NVARCHAR(50),
    Operation NVARCHAR(50),
    ChangedData NVARCHAR(MAX),
    ChangedBy NVARCHAR(100),
    ChangedAt DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_AuditLog_Datasets
ON Datasets
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @operation NVARCHAR(50);
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @operation = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @operation = 'INSERT';
    ELSE
        SET @operation = 'DELETE';

    INSERT INTO AuditLog (TableName, Operation, ChangedData, ChangedBy)
    SELECT 'Datasets', @operation, (SELECT * FROM inserted FOR JSON PATH), SYSTEM_USER;
END;
