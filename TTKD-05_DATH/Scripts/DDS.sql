Create database UK_Accidents_DDS
GO
Use UK_Accidents_DDS
Go
CREATE TABLE [TimeOfDay](
    [IDTime] int Identity(1,1) NOT NULL PRIMARY KEY,
	[IDDay] int,
	[Time] varchar(50)
)
CREATE TABLE [DayOfMonth](
    [IDDay] int Identity(1,1) NOT NULL PRIMARY KEY,
	[IDMonth] int,
	[Day] varchar(50),
)

CREATE TABLE [MonthOfQuarter](
    [IDMonth] int Identity(1,1) NOT NULL PRIMARY KEY,
	[IDQuarter] int,
	[Month] varchar(50),
)


CREATE TABLE [QuarterOfYear](
    [IDQuarter] int Identity(1,1) NOT NULL PRIMARY KEY,
	[IDYear] int,
	[Quarter] varchar(50)
)


CREATE TABLE [Year](
	[IDYear] int Identity(1,1) NOT NULL PRIMARY KEY,
	[Year] int,
)

CREATE TABLE [County](
    [IDCounty] int Identity(1,1) NOT NULL PRIMARY KEY, 
	[IDRegion] int,
	[CountyName]  [varchar](50)
)
CREATE TABLE [Region](
    [IDRegion] int NOT NULL PRIMARY KEY,
	[IDCountry] int,
	[RegionCode]  [varchar](50),
	[RegionName]  [varchar](50)
)

CREATE TABLE [Country](
    [IDCountry] int NOT NULL PRIMARY KEY,
	[CountryCode]  [varchar](50),
	[CountryName]  [varchar](50)
)

CREATE TABLE [Local_Authority(Distric)](
    [ID_LAD] int NOT NULL PRIMARY KEY,
	[LAD_Name]  [varchar](50),
)


CREATE TABLE [SexOfCasualty](
    [ID_Sex] int NOT NULL PRIMARY KEY,
	[Sex]  [varchar](50),
)

CREATE TABLE [AgeBandOfCasualty](
    [IDAgeBand] int NOT NULL PRIMARY KEY,
	[AgeBand]  [varchar](50)
)

CREATE TABLE [CasualtySerity](
    [IDCasualtySerity] int NOT NULL PRIMARY KEY,

	[CasualtySerity]  [varchar](50)
)
CREATE TABLE [AccidentSerity](
    [IDAccidentSerity] int NOT NULL PRIMARY KEY,

	[AccidentSerity]  [varchar](50)
)

CREATE TABLE [CasualtyType](
    [IDCasualtyType] int NOT NULL PRIMARY KEY,

	[CasualtyType]  [varchar](100)
)

CREATE TABLE [RoadType](
    [IDRoadType] int NOT NULL PRIMARY KEY,
	[RoadType]  [varchar](50)
)


CREATE TABLE [VehicleType](
    [IDVehicleType] int NOT NULL PRIMARY KEY,
	[VehicleType]  [varchar](50)
)

CREATE TABLE [RuralOrUrbanArea](
    [IDRuralOrUrbanArea] int NOT NULL PRIMARY KEY,
	[RuralOrUrban]  [varchar](50)
)

CREATE TABLE [BuildUpRoad](
    [IDBuildUpRoad] int Identity(1,1) NOT NULL PRIMARY KEY,
	[BuildUpRoad]  varchar(50)
)

CREATE TABLE [JourneyPurpose](
    [IDJourneyPurpose] int NOT NULL PRIMARY KEY,
	[Journey_Purpose] [varchar](50)
)

CREATE TABLE [FactAccident](
    [IDFactAccidents] int Identity(1,1) NOT NULL PRIMARY KEY,
	[ID_Journey_Purpose] int ,
	[ID_AccidentSerity] int ,
	[ID_BuildUpRoad] int ,
	[ID_RoadType] int ,
	[ID_VehicleType] int ,
	[ID_County] int ,
	[ID_UrbanOrRural] int ,
	[ID_Time] int ,
	[NumberOfCasualty] int ,
	[ID_Accidents] int,
	[VehicleID] int,
)
CREATE TABLE [FactAccidentsVariance](
    [IDFactAccidentsVariance] int Identity(1,1) NOT NULL PRIMARY KEY,
	[ID_Year] int ,
	NumberOfAccidents int
)
CREATE TABLE [FactCasualty](
    [IDFactCasualty] int Identity(1,1) NOT NULL PRIMARY KEY,
	[ID_AgeBand] int ,
	[ID_SexOfCasualty] int ,
	[ID_CasualtyType] int ,
	[ID_CasualtySerity] int ,
	[ID_LAD] int ,
	[ID_Time] int ,
	[ID_Accidents] int,
	[CasualtyID] int,
)

	Alter table [TimeOfDay]
	ADD  CONSTRAINT FK_Time_Day FOREIGN KEY ([IDDay]) REFERENCES [DayOfMonth]([IDDay])

	Alter table [DayOfMonth]
	ADD CONSTRAINT FK_Day_Month FOREIGN KEY ([IDMonth]) REFERENCES [MonthOfQuarter]([IDMonth])

	Alter table [MonthOfQuarter]
	ADD CONSTRAINT FK_Month_Quarter FOREIGN KEY ([IDQuarter]) REFERENCES [QuarterOfYear]([IDQuarter])

	Alter table [QuarterOfYear]
	ADD CONSTRAINT FK_Quarter_Year FOREIGN KEY ([IDYear]) REFERENCES [Year]([IDYear])

	Alter table [County]
	ADD  CONSTRAINT FK_County_Region FOREIGN KEY ([IDRegion]) REFERENCES [Region]([IDRegion])

	Alter table [Region]
	ADD CONSTRAINT FK_Region_Country FOREIGN KEY ([IDCountry]) REFERENCES [Country]([IDCountry])

	Alter table [FactAccidentsVariance]
	ADD  CONSTRAINT FK_Time_AccidentsVarian FOREIGN KEY ([ID_Year]) REFERENCES [Year]([IDYear])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_Time_Accidents FOREIGN KEY ([ID_Time]) REFERENCES [TimeOfDay]([IDTime])
				
	Alter table [FactAccident]
	ADD  CONSTRAINT FK_JourneyPurpose_Accidents FOREIGN KEY ([ID_Journey_Purpose]) REFERENCES [JourneyPurpose]([IDJourneyPurpose])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_AccidentSerity_Accidents FOREIGN KEY ([ID_AccidentSerity]) REFERENCES [AccidentSerity]([IDAccidentSerity])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_BuildUpRoad_Accidents FOREIGN KEY ([ID_BuildUpRoad]) REFERENCES [BuildUpRoad]([IDBuildUpRoad])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_RoadType_Accidents FOREIGN KEY ([ID_RoadType]) REFERENCES [RoadType]([IDRoadType])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_VehicleType_Accidents FOREIGN KEY ([ID_VehicleType]) REFERENCES [VehicleType]([IDVehicleType])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_County_Accidents FOREIGN KEY ([ID_County]) REFERENCES [County]([IDCounty])

	Alter table [FactAccident]
	ADD  CONSTRAINT FK_UrbanOrRural_Accidents FOREIGN KEY ([ID_UrbanOrRural]) REFERENCES [RuralOrUrbanArea]([IDRuralOrUrbanArea])

	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_AgeBand_Casualty FOREIGN KEY ([ID_AgeBand]) REFERENCES [AgeBandOfCasualty]([IDAgeBand])

	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_Sex_Casualty FOREIGN KEY ([ID_SexOfCasualty]) REFERENCES [SexOfCasualty]([ID_Sex])

	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_CasualtyType_Casualty FOREIGN KEY ([ID_CasualtyType]) REFERENCES [CasualtyType]([IDCasualtyType])

	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_CasualtySerity_Casualty FOREIGN KEY ([ID_CasualtySerity]) REFERENCES [CasualtySerity]([IDCasualtySerity])
	
	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_LAD_Casualty FOREIGN KEY ([ID_LAD]) REFERENCES [Local_Authority(Distric)]([ID_LAD])

	Alter table [FactCasualty]
	ADD  CONSTRAINT FK_Time_Casualty FOREIGN KEY ([ID_Time]) REFERENCES [TimeOfDay]([IDTime])
go

---------------- Context
CREATE TABLE [AgeBandContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [RuralOrUrbanContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [RoadTypeContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [VehicleTypeContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [AccidentSerityContext] (
    [code] int,
    [label] [varchar](50)
);


CREATE TABLE [JourneyPurposeContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [CasualtySerityContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [CasualtySexContext] (
    [code] int,
    [label] [varchar](50)
);
go

CREATE TABLE [CasualtyTypeContext] (
    [code] int,
    [label] [varchar](100)
);
go

CREATE TABLE [LADContext] (
    [code] int,
    [label] [varchar](50)
);