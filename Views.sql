CREATE VIEW DatasetsByScientist AS
SELECT 
    s.Name AS ScientistName,
    d.Title AS DatasetTitle,
    p.Title AS ProjectTitle
FROM 
    Scientists s
JOIN ProjectDatasets pd ON s.ScientistID = pd.ProjectID
JOIN Datasets d ON pd.DatasetID = d.DatasetID
JOIN Projects p ON pd.ProjectID = p.ProjectID;

CREATE VIEW PublicationsByProject AS
SELECT
    p.Title AS ProjectTitle,
    pub.Title AS PublicationTitle,
    pub.PublishedDate AS PublicationDate
FROM
    Projects p
JOIN ProjectDatasets pd ON p.ProjectID = pd.ProjectID
JOIN DatasetPublications dp ON pd.DatasetID = dp.DatasetID
JOIN Publications pub ON dp.PublicationID = pub.PublicationID;