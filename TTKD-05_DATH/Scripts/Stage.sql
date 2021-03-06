USE [master]
GO
/****** Object:  Database [UK_Accidents]    Script Date: 1/8/2022 4:56:45 PM ******/
CREATE DATABASE [UK_Accidents]
Go
USE [UK_Accidents]
GO
/****** Object:  Table [dbo].[Accidents]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents](
	[Accident_Index] [varchar](50) NULL,
	[Time] [datetime] NULL,
	[Local_Authority_(District)] [int] NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[LSOA_of_Accident_Location] [varchar](50) NULL,
	[Accident_Severity] [int] NULL,
	[Date] [varchar](50) NULL,
	[Local_Authority_(Highway)] [varchar](50) NULL,
	[Number_of_Vehicles] [int] NULL,
	[Number_of_Casualties] [int] NULL,
	[Day_of_Week] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualties](
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Reference] [int] NULL,
	[Casualty_Reference] [int] NULL,
	[Casualty_Class] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA_postcode]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA_postcode](
	[pcd7] [varchar](50) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[lsoa11nm] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA_postcode_fix]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA_postcode_fix](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pcd7] [varchar](50) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[lsoa11nm] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UK_postcode]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UK_postcode](
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[region_code] [varchar](50) NULL,
	[region_name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 1/8/2022 4:56:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Journey_Purpose_of_Driver] [int] NULL,
	[Sex_of_Driver] [int] NULL,
	[Age_of_Driver] [int] NULL,
	[Age_Band_of_Driver] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UK_Accidents] SET  READ_WRITE 
GO
