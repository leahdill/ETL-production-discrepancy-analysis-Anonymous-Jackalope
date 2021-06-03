# ETL-Project-Anonymous-Jackalope

For this project, our purpose was to find datasets to extract, load, and transform into universally usable datasets
for further analysis. The goal was to utilize processes that could be easily replicated and implemented by any
future data scientists that may need to access the data.

We chose to use data primarily from a Denver-based oil and gas company's December 2020 production reporting period.
We pulled raw SCADA (wellhead meter readings measured in Mcf), PRAMS data (post-production software exports measured in 
Mcf), two meter documents that acted as joiners, and retail gas price data pulled from EIA to illustrate the economic 
climate of that time period.

We read our csv's into Pandas in order to concatenate our meter documents into one universal dictionary. We then pared
down the columns in our SCADA, PRAMS, and gas prices documents, and we renamed the headers for easier readibility once 
we loaded to our SQL database. We then created a connection from Pandas to postgres, and tested that connection before
moving forward.

We developed an ERD for creating tables and relating our datasets, and we got to work in pgAdmin loading our new Pandas 
dataframes into SQL. 

Once these connections were confirmed and ran successfully, we took note that there is actually
a significant production reporting discrepancy between the direct meter readings and the post-production exports.
Finding this error was a massive help to the company we were "auditing" for this class project and they were able to 
correct the error once they found that the post-production numbers were being reported as production data two days 
after it was actually coming off the wellhead. Our small group project for school helped this company avoid major 
confusion in future audits. 
