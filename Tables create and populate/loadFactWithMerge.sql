with observations as 
(select 
	Sitecode,
	Speciesid,
	(cast(year(date) as int))*100 + (cast (month(date) as int))  as YearMonth,
	Lowerbound,
	Upperbound,
	--CountingType,
	dataquality,
	populationType,
	abundance as AboundanceCategory,
	Population,
	Conservation,
	Isolation,
	Global
 from [staging].[species] 
	join [warehouse].[Dim_species] 
	on [warehouse].[Dim_species].speciescode = staging.species.speciescode
		or [warehouse].[Dim_species].speciesname = staging.species.speciesname
)
MERGE [warehouse].[FactSpecies] as Target
USING observations as Source
ON (
	target.yearmonth = source.yearmonth and 
	target.sitecode = source.sitecode and 
	target.speciesid = Source.speciesid
	)
WHEN NOT MATCHED BY TARGET
THEN INSERT (Sitecode,
	Speciesid,
	YearMonth,
	Lowerbound,
	Upperbound,
	--CountingType,
	dataquality,
	populationType,
	AboundanceCategory,
	Population,
	Conservation,
	Isolation,
	Global
) 
values (
	source.Sitecode,
	source.Speciesid,
	source.YearMonth,
	source.Lowerbound,
	source.Upperbound,
	--source.CountingType,
	source.dataquality,
	source.populationType,
	source.AboundanceCategory,
	source.Population,
	source.Conservation,
	source.Isolation,
	source.Global);