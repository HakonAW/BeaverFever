Create schema Staging
	Create table FactSpecies (
	[ObservationID]             int identity primary key ,
	[Site_Code]                 varchar(10) ,
	[SpecieId]                  int  ,
	[YearMonth]                 int  ,
	[LOWERBOUND]                int  ,
	[UPPERBOUND]                int ,
	[CountingType]              char(10) ,
	[Dataquality]               char(1) ,
	[PopulationType]            char(1) ,
	[AboundanceCategory]        char(1) ,
	[Population]                char(1),
	[Conservation]              char(1),
	[Isolation]	                char(1),
	[Global]                    char(1))

