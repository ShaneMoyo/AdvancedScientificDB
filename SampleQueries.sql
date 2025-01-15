SELECT 
    p.Title AS ProjectTitle,
    d.Title AS DatasetTitle,
    d.CreatedDate AS DatasetCreatedDate,
    d.VersionNumber AS DatasetVersion
FROM 
    Projects p
JOIN ProjectDatasets pd ON p.ProjectID = pd.ProjectID
JOIN Datasets d ON pd.DatasetID = d.DatasetID
WHERE 
    p.ProjectID = 1;

SELECT 
    d.Title AS DatasetTitle,
    pub.Title AS PublicationTitle,
    pub.PublishedDate AS PublicationDate
FROM 
    Datasets d
JOIN DatasetPublications dp ON d.DatasetID = dp.DatasetID
JOIN Publications pub ON dp.PublicationID = pub.PublicationID
WHERE 
    d.DatasetID = 1;

SELECT 
    s.Name AS ScientistName,
    d.Title AS DatasetTitle,
    d.VersionNumber AS DatasetVersion,
    p.Title AS ProjectTitle
FROM 
    Scientists s
JOIN ProjectDatasets pd ON s.ScientistID = pd.ProjectID
JOIN Datasets d ON pd.DatasetID = d.DatasetID
JOIN Projects p ON pd.ProjectID = p.ProjectID
WHERE 
    s.Name = 'Alice Johnson';

SELECT 
    Title AS PublicationTitle,
    CitationCount
FROM 
    Publications
ORDER BY 
    CitationCount DESC
LIMIT 5;

SELECT 
    TableName,
    Operation,
    ChangedData,
    ChangedBy,
    ChangedAt,
    ChangedFromIP
FROM 
    AuditLog
WHERE 
    TableName = 'Datasets'
ORDER BY 
    ChangedAt DESC;

SELECT 
    p.Title AS ProjectTitle,
    pub.Title AS PublicationTitle,
    pub.PublishedDate AS PublicationDate
FROM 
    Projects p
JOIN ProjectDatasets pd ON p.ProjectID = pd.ProjectID
JOIN DatasetPublications dp ON pd.DatasetID = dp.DatasetID
JOIN Publications pub ON dp.PublicationID = pub.PublicationID;

SELECT 
    dm.MetadataKey,
    dm.MetadataValue
FROM 
    DatasetMetadata dm
WHERE 
    dm.DatasetID = 1;

SELECT 
    d.Title AS DatasetTitle
FROM 
    Datasets d
LEFT JOIN DatasetPublications dp ON d.DatasetID = dp.DatasetID
WHERE 
    dp.PublicationID IS NULL;

SELECT 
    YEAR(PublishedDate) AS PublicationYear,
    COUNT(*) AS PublicationCount
FROM 
    Publications
GROUP BY 
    YEAR(PublishedDate)
ORDER BY 
    PublicationYear;

SELECT 
    Title AS DatasetTitle
FROM 
    Datasets
WHERE 
    Title LIKE '%Temperature%';
