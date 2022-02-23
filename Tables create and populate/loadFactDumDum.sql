insert into warehouse.factspecies
select
	Sitecode,
	Speciesid,
	(cast(year(date) as int))*100 + (cast (month(date) as int))  as YearMonth,
	Lowerbound,
	Upperbound,
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