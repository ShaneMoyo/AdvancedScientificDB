ALTER TABLE Datasets
ADD VersionNumber INT DEFAULT 1;

CREATE TABLE DatasetMetadata (
    MetadataID INT IDENTITY PRIMARY KEY,
    DatasetID INT NOT NULL FOREIGN KEY REFERENCES Datasets(DatasetID),
    MetadataKey NVARCHAR(100) NOT NULL,
    MetadataValue NVARCHAR(MAX)
);

INSERT INTO DatasetMetadata (DatasetID, MetadataKey, MetadataValue)
SELECT DatasetID, 'Description', Title
FROM Datasets;

ALTER TABLE Publications
ADD CitationCount INT DEFAULT 0;

UPDATE Publications
SET CitationCount = CASE
    WHEN Title LIKE '%Impact%' THEN 50
    WHEN Title LIKE '%Quantum%' THEN 100
    ELSE 0
END;

CREATE INDEX IDX_Publications_CitationCount
ON Publications (CitationCount);

ALTER TABLE AuditLog
ADD ChangedFromIP NVARCHAR(45);

CREATE OR ALTER TRIGGER trg_AuditLog_Changes
ON AuditLog
AFTER INSERT
AS
BEGIN
    UPDATE AuditLog
    SET ChangedFromIP = CONNECTIONPROPERTY('client_net_address')
    WHERE ChangedFromIP IS NULL;
END;

CREATE ROLE DataAnalyst;

GRANT SELECT ON Scientists TO DataAnalyst;
GRANT SELECT ON Projects TO DataAnalyst;
GRANT SELECT ON Datasets TO DataAnalyst;
GRANT SELECT ON Publications TO DataAnalyst;
GRANT SELECT ON AuditLog TO DataAnalyst;
