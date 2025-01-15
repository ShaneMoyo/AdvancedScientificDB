INSERT INTO Scientists (Name, Email, Role) VALUES
    ('Alice Johnson', 'alice.johnson@example.com', 'Admin'),
    ('Bob Smith', 'bob.smith@example.com', 'Researcher');

INSERT INTO Projects (Title, StartDate, EndDate) VALUES
    ('Climate Change Impact Study', '2024-01-01', '2025-12-31'),
    ('Quantum Computing Research', '2023-06-01', NULL);

INSERT INTO Datasets (Title) VALUES
    ('Temperature Data 2024'),
    ('Quantum Simulation Results');

INSERT INTO Publications (Title, PublishedDate, DOI) VALUES
    ('Impact of Climate Change on Agriculture', '2024-06-15', '10.1000/xyz123'),
    ('Advances in Quantum Algorithms', '2023-09-20', '10.1000/abc456');

INSERT INTO ProjectDatasets (ProjectID, DatasetID) VALUES
    (1, 1),
    (2, 2);

INSERT INTO DatasetPublications (DatasetID, PublicationID) VALUES
    (1, 1),
    (2, 2);
