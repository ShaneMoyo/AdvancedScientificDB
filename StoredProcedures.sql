CREATE PROCEDURE LinkDatasetToPublication
    @DatasetID INT,
    @PublicationID INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM DatasetPublications
        WHERE DatasetID = @DatasetID AND PublicationID = @PublicationID
    )
    BEGIN
        INSERT INTO DatasetPublications (DatasetID, PublicationID)
        VALUES (@DatasetID, @PublicationID);
        PRINT 'Dataset linked to publication successfully!';
    END
    ELSE
    BEGIN
        PRINT 'This dataset is already linked to the publication.';
    END
END;