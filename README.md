# Jennifer Lin (jlin123) and Tanner Amundsen (tamunds1)
# CS315 - Databases Final Project

Database Name: COVID19
Small Database Name: COVID19_small

During Phase C, we noticed that even after we parsed our data into txt files, there was still
formatting that needed to be done before we were ready to load the data into our tables.
First, we had null values in the .txt files represented as the string "NULL". To make
the values null in the database, we used the nullif command in our setup scripts. Second,
the gdp data from the UN represented the GDP as strings that were formatted with cosmetic
commas representing thousands. We fixed this by making an intermediate semicolon-delimeted
CSV and find-and-deleting commas in numbers.

The small version of our database (COVID19-small) contains data only on countries that, on
April 12th 2020, were among the 15 countries with the highest number of confirmed cases of
COVID-19 according to JHU. Our small tables sometimes have >15 rows because, for example, the
dailyCOVID19Reports have data for several days. Additionally, the ImportsFrom_small and
ExportsTo_small have >15 rows because each country can have several trading partners.

All data gathered from the UN represents data from the same year for any given attribute.
So, for example, the gdpPerCapita for each country is data from 2017 for each country because that
is the most recent data. For countries that didn't have data from the most recent year for a given
attribute, their attribute is listed as null.

