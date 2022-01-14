    --- Thêm cột Id cho bảng LSOA ---
    USE UK_Accidents
    Go

    CREATE TABLE dbo.LSOA_postcode_fix(Id int NOT NULL IDENTITY(1, 1), pcd7 varchar(50),lsoa11cd varchar(50), lsoa11nm varchar(50))  
    ON[PRIMARY]  
    go  

    IF EXISTS(SELECT * FROM dbo.LSOA_postcode)  
    INSERT INTO dbo.LSOA_postcode_fix(pcd7, lsoa11cd, lsoa11nm)  
    SELECT pcd7, lsoa11cd, lsoa11nm 
    FROM dbo.LSOA_postcode TABLOCKX
    order by lsoa11cd
    go 