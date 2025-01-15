CREATE TABLE Scientists (
    ScientistID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) UNIQUE NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

CREATE TABLE Projects (
    ProjectID INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Datasets (
    DatasetID INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    VersionNumber INT DEFAULT 1,
    CreatedDate DATE DEFAULT GETDATE()
);

CREATE TABLE Publications (
    PublicationID INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    PublishedDate DATE,
    DOI NVARCHAR(100)
);

CREATE TABLE ProjectDatasets (
    ProjectID INT NOT NULL FOREIGN KEY REFERENCES Projects(ProjectID),
    DatasetID INT NOT NULL FOREIGN KEY REFERENCES Datasets(DatasetID),
    PRIMARY KEY (ProjectID, DatasetID)
);

CREATE TABLE DatasetPublications (
    DatasetID INT NOT NULL FOREIGN KEY REFERENCES Datasets(DatasetID),
    PublicationID INT NOT NULL FOREIGN KEY REFERENCES Publications(PublicationID),
    PRIMARY KEY (DatasetID, PublicationID)
);

CREATE TABLE AuditLog (
    LogID INT IDENTITY PRIMARY KEY,
    TableName NVARCHAR(50),
    Operation NVARCHAR(50),
    ChangedData NVARCHAR(MAX),
    ChangedBy NVARCHAR(100),
    ChangedAt DATETIME DEFAULT GETDATE()
);
