drop table if exists temp_table;
create table temp_table as 
Select 
	meter_combo."Well_Name" as well_name,
	round(sum(prams_data."Total_Gas_Production_Mcf")) as prams_data_production,
	round(sum(scada_data."Yesterdays_Gas_Production_Mcf")) as scada_data_production
	
From meter_combo
 	Join prams_data
  	on prams_data."Well_Name" = meter_combo."Well_Name"
Join scada_data
	on scada_data."Meter_ID" = meter_combo."Meter_ID"
Group by 1
Order by 2 desc;

Select * , prams_data_production - scada_data_production as variance, 
round((prams_data_production - scada_data_production) * 2.11) as profit_diff
From temp_table