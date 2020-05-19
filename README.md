# Jennifer Lin (jlin123) and Tanner Amundsen (tamunds1)
# CS315 - Databases Final Project

Topic: COVID-19 data with UN country data

Our database project focuses on the relationships between the COVID-19 outbreak and the economic, demographic, social, and infrastructural indicators of each country. Data coming in on the COVID-19 outbreak is presented almost entirely to be grouped by country. Although neither of us are epidemiologists or physicians, we are aware of certain statistics/measurements that, at the country level, would be insightful when grouped by things like COVID-19 attacks rates, transmission rates, and fatality rates. Our goal is to measure and monitor relationships that emerge between the nature of the outbreak (deadliness, location, etc.) and various UN data at the country level. We are also interested in querying UN country data (like population, education, gdp, etc.) in reference to COVID data.

All data gathered from the UN represents data from the same year for any given attribute.
So, for example, the gdpPerCapita for each country is data from 2017 for each country because that
is the most recent data. For countries that didn't have data from the most recent year for a given
attribute, their attribute is listed as null.

The small version of our database (COVID19-small) contains data only on countries that, on
April 12th 2020, were among the 15 countries with the highest number of confirmed cases of
COVID-19 according to JHU. Our small tables sometimes have >15 rows because, for example, the
dailyCOVID19Reports have data for several days. Additionally, the ImportsFrom_small and
ExportsTo_small have >15 rows because each country can have several trading partners.

Demo Video: https://youtu.be/JQt8q7fM5kA

