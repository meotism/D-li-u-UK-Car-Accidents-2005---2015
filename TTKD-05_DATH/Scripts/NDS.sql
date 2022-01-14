create database UK_Accidents_NDS
go 
use UK_Accidents_NDS
go
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accidents_NDS](
	Id_Accidents INT IDENTITY(1,1) NOT NULL,
	[Accident_Index] [varchar](50) NULL 
      ,[Accident_Severity] INT NULL
      ,[Date] DATETIME NULL
      ,[Time] [varchar](50) NULL
      ,[Local_Authority_(District)] INT NULL
      ,[Number_of_Casualties] INT NULL
      ,[Number_of_Vehicles] INT NULL
      ,[Local_Authority_(Highway)] [varchar](50) NULL
      ,[Road_Type] INT NULL
      ,[Speed_limit] INT NULL
      ,[Urban_or_Rural_Area] INT NULL
      ,[Id_LSOA_postcode] INT NULL
	  ,[Builtup_Road] varchar(50) NULL
	  ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
PRIMARY KEY CLUSTERED 
(
	[Id_Accidents] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Vehicles_NDS](
Id_Vehicles INT IDENTITY(1,1) NOT NULL,
	[Id_Accidents] INT NULL
      ,[Vehicle_Reference] INT NULL
      ,[Vehicle_Type] INT NULL
      ,[Journey_Purpose_of_Driver]  INT NULL
      ,[Sex_of_Driver] INT NULL
      ,[Age_of_Driver] INT NULL
      ,[Age_Band_of_Driver] INT NULL
	  ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
PRIMARY KEY CLUSTERED 
(
	Id_Vehicles ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Casualties_NDS](
	Id_Casualties INT IDENTITY(1,1) NOT NULL,
	Id_Vehicles INT NULL
      ,[Casualty_Reference] INT NULL
      ,[Casualty_Class] INT NULL
      ,[Sex_of_Casualty] INT NULL
      ,[Age_of_Casualty] INT NULL
      ,[Age_Band_of_Casualty] INT NULL
      ,[Casualty_Severity] INT NULL
      ,[Casualty_Type] INT NULL
	  ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
PRIMARY KEY CLUSTERED 
(
	Id_Casualties ASC 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[LSOA_postcode_NDS](
	  Id_LSOA_postcode INT IDENTITY(1,1) NOT NULL,
	 [lsoa_index] [varchar](50) NOT NULL
      ,Id_UK_postcode INT NULL 
      ,[lsoa_address] [varchar](50) NULL
	  ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
PRIMARY KEY CLUSTERED 
(
  Id_LSOA_postcode ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[UK_postcode_NDS](
	  Id_UK_postcode INT IDENTITY(1,1) NOT NULL,
      [postcode] [varchar](50) NOT NULL
      ,[city] [varchar](50) NULL
      ,[county] [varchar](50) NULL
      ,Id_region INT NULL
	  ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
    
PRIMARY KEY CLUSTERED 
(
	Id_UK_postcode ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[country_NDS](
	Id_country INT IDENTITY(1,1) NOT NULL,
      [country_code] [varchar](50) NOT NULL
      ,[country_name] [varchar](50) NULL
	    ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
     
PRIMARY KEY CLUSTERED 
(
	 Id_country ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[region_NDS](
Id_region INT IDENTITY(1,1) NOT NULL,
       [region_code] [varchar](50) NOT NULL
	   , Id_country INT NULL
      ,[region_name] [varchar](50) NULL
	    ,[CreatedDate] datetime NULL
	  ,[UpdatedDate] datetime NULL
PRIMARY KEY CLUSTERED 
(
	Id_region ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


alter table Vehicles_NDS add FOREIGN key (Id_Accidents) REFERENCES Accidents_NDS(Id_Accidents)
GO
alter table Casualties_NDS add FOREIGN key (Id_Vehicles) REFERENCES Vehicles_NDS(Id_Vehicles)
GO
alter table UK_postcode_NDS add FOREIGN key (Id_region) REFERENCES region_NDS(Id_region)
GO
alter table LSOA_postcode_NDS add FOREIGN key (Id_UK_postcode) REFERENCES UK_postcode_NDS(Id_UK_postcode)
GO
alter table Accidents_NDS add FOREIGN key (Id_LSOA_postcode) REFERENCES LSOA_postcode_NDS(Id_LSOA_postcode)
GO
alter table region_NDS add FOREIGN key (Id_country) REFERENCES country_NDS(Id_country)
GO