-- Jennifer Lin, jlin123
-- Tanner Amundsen, tamunds1

DROP TABLE IF EXISTS DailyCOVID19Reports_small;
DROP TABLE IF EXISTS Population_small;
DROP TABLE IF EXISTS Education_small;
DROP TABLE IF EXISTS LaborForce_small;
DROP TABLE IF EXISTS Travel_small;
DROP TABLE IF EXISTS Health_small;
DROP TABLE IF EXISTS GDP_small;
DROP TABLE IF EXISTS ImportsFrom_small;
DROP TABLE IF EXISTS ExportsTo_small;
DROP TABLE IF EXISTS Country_small;

CREATE TABLE Country_small (
  countryId INTEGER NOT NULL,
  name VARCHAR(40) NOT NULL,
  PRIMARY KEY (countryId)
);

CREATE TABLE DailyCOVID19Reports_small (
  countryId INTEGER NOT NULL,
  date DATE NOT NULL,
  numConfirmed INTEGER,
  numDeaths INTEGER,
  numRecovered INTEGER,
  PRIMARY KEY (countryId, date),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE Population_small (
  countryId INTEGER NOT NULL,
  estPopSize FLOAT(2),
  popDensity FLOAT(1),
  rateIncrease NUMERIC(3, 1),
  lifeExpectancy NUMERIC(3, 1),
  mortalityRate NUMERIC(3, 1),
  fertilityRate NUMERIC(3, 1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE Education_small (
  countryId INTEGER NOT NULL,
  totalPublicExp NUMERIC(3, 1),
  primaryEdPercent NUMERIC(3, 1),
  secondaryEdPercent NUMERIC(3, 1),
  tertiaryEdPercent NUMERIC(3, 1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE LaborForce_small (
  countryId INTEGER NOT NULL,
  laborForceParticipationRate NUMERIC(3, 1),
  unemploymentRate NUMERIC(3, 1),
  percentEmplAgriculture NUMERIC(3, 1),
  percentEmplIndustry NUMERIC(3, 1),
  percentEmplServices NUMERIC(3, 1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE Travel_small (
  countryId INTEGER NOT NULL,
  migrantPercentOfPop NUMERIC(3, 1),
  numRefugeesAndAsylum INTEGER,
  tourismExp INTEGER,
  numTourists INTEGER,
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE Health_small (
  countryId INTEGER NOT NULL,
  healthExp NUMERIC(3,1),
  physiciansPer1000 NUMERIC(2,1),
  popUsingSafeSanitationFacilities NUMERIC(3,1),
  popUsingSafeWaterServices NUMERIC(3,1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE GDP_small (
  countryId INTEGER NOT NULL,
  gdp INTEGER,
  gdpPerCapita INTEGER,
  rdGDPExp NUMERIC(3,1),
  healthGDPExp NUMERIC(3,1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

CREATE TABLE ImportsFrom_small (
  countryId INTEGER NOT NULL,
  importFromCountryId INTEGER NOT NULL,
  percentImportOfTotalTrade NUMERIC(3,1),
  PRIMARY KEY (countryId, importFromCountryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId),
  FOREIGN KEY (importFromCountryId) REFERENCES Country_small (countryId)
);

CREATE TABLE ExportsTo_small (
  countryId INTEGER NOT NULL,
  exportToCountryId INTEGER NOT NULL,
  percentExportOfTotalTrade NUMERIC(3,1),
  PRIMARY KEY (countryId, exportToCountryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId),
  FOREIGN KEY (exportToCountryId) REFERENCES Country_small (countryId)
);

LOAD DATA LOCAL INFILE './small_relation_data/country-small.txt'
 INTO TABLE Country_small
 FIELDS TERMINATED BY '/'
 IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './small_relation_data/dailyCOVID19-small.txt'
 INTO TABLE DailyCOVID19Reports_small
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './small_relation_data/population-small.txt'
 INTO TABLE Population_small
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES
 (countryId, @vestPopSize, @vpopDensity, @vrateIncrease, @vlifeExpectancy,
   @vmortalityRate, @vfertilityRate)
 SET
 estPopSize = nullif(@vestPopSize,'NULL'),
 popDensity = nullif(@vpopDensity,'NULL'),
 rateIncrease = nullif(@vrateIncrease,'NULL'),
 lifeExpectancy = nullif(@vlifeExpectancy,'NULL'),
 mortalityRate = nullif(@vmortalityRate,'NULL'),
 fertilityRate = nullif(@vfertilityRate,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/education-small.txt'
 INTO TABLE Education_small
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES
 (countryId, @vtotalPublicExp, @vprimaryEdPercent, @vsecondaryEdPercent,
   @vtertiaryEdPercent)
 SET
 totalPublicExp = nullif(@vtotalPublicExp,'NULL'),
 primaryEdPercent = nullif(@vprimaryEdPercent,'NULL'),
 secondaryEdPercent = nullif(@vsecondaryEdPercent,'NULL'),
 tertiaryEdPercent = nullif(@vtertiaryEdPercent,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/laborForce-small.txt'
 INTO TABLE LaborForce_small
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES
 (countryId, @vlaborForceParticipationRate, @vunemploymentRate,
   @vpercentEmplAgriculture, @vpercentEmplIndustry, @vpercentEmplServices)
 SET
 laborForceParticipationRate = nullif(@vlaborForceParticipationRate,'NULL'),
 unemploymentRate = nullif(@vunemploymentRate,'NULL'),
 percentEmplAgriculture = nullif(@vpercentEmplAgriculture,'NULL'),
 percentEmplIndustry = nullif(@vpercentEmplIndustry,'NULL'),
 percentEmplServices = nullif(@vpercentEmplServices,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/travel-small.txt'
 INTO TABLE Travel_small
 FIELDS TERMINATED BY ','
 IGNORE 1 LINES
 (countryId, @vmigrantPercentOfPop, @vnumRefugeesAndAsylum,
   @vtourismExp, @vnumTourists)
 SET
 migrantPercentOfPop = nullif(@vmigrantPercentOfPop,'NULL'),
 numRefugeesAndAsylum = nullif(@vnumRefugeesAndAsylum,'NULL'),
 tourismExp = nullif(@vtourismExp,'NULL'),
 numTourists = nullif(@vnumTourists,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/health-small.txt'
 INTO TABLE Health_small
 FIELDS TERMINATED BY ','
 IGNORE 1 LINES
 (countryId, @vhealthExp, @vphysiciansPer1000, @vpopUsingSafeSanitationFacilities,
   @vpopUsingSafeWaterServices)
 SET
 healthExp = nullif(@vhealthExp,'NULL'),
 physiciansPer1000 = nullif(@vphysiciansPer1000,'NULL'),
 popUsingSafeSanitationFacilities = nullif(@vpopUsingSafeSanitationFacilities,'NULL'),
 popUsingSafeWaterServices = nullif(@vpopUsingSafeWaterServices,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/gdp-small.txt'
 INTO TABLE GDP_small
 FIELDS TERMINATED BY ','
 IGNORE 1 LINES
 (countryId, @vgdp, @vgdpPerCapita, @vrdGDPExp, @vhealthGDPExp)
 SET
 gdp = nullif(@vgdp,'NULL'),
 gdpPerCapita = nullif(@vgdpPerCapita,'NULL'),
 rdGDPExp = nullif(@vrdGDPExp,'NULL'),
 healthGDPExp = nullif(@vhealthGDPExp,'NULL');

LOAD DATA LOCAL INFILE './small_relation_data/importsFrom-small.txt'
 INTO TABLE ImportsFrom_small
 FIELDS TERMINATED BY ','
 IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './small_relation_data/exportsTo-small.txt'
 INTO TABLE ExportsTo_small
 FIELDS TERMINATED BY ','
 IGNORE 1 LINES;

 delimiter //
 DROP PROCEDURE IF EXISTS small_CovidSortBy //
 CREATE PROCEDURE small_CovidSortBy(IN covid_date VARCHAR(40), covid_attribute VARCHAR(40))
 BEGIN
   IF covid_attribute = 'numConfirmed' THEN
     SELECT Country_small.name, DailyCOVID19Reports_small.numConfirmed, DailyCOVID19Reports_small.numDeaths, DailyCOVID19Reports_small.numRecovered
     FROM DailyCOVID19Reports_small, Country_small
     WHERE DailyCOVID19Reports_small.countryId = Country_small.countryId AND date = covid_date
     ORDER BY numConfirmed DESC;
   ELSEIF covid_attribute = 'numDeaths' THEN
     SELECT Country_small.name, DailyCOVID19Reports_small.numConfirmed, DailyCOVID19Reports_small.numDeaths, DailyCOVID19Reports_small.numRecovered
     FROM DailyCOVID19Reports_small, Country_small
     WHERE DailyCOVID19Reports_small.countryId = Country_small.countryId AND date = covid_date
     ORDER BY numDeaths DESC;
   ELSE
     SELECT Country_small.name, DailyCOVID19Reports_small.numConfirmed, DailyCOVID19Reports_small.numDeaths, DailyCOVID19Reports_small.numRecovered
     FROM DailyCOVID19Reports_small, Country_small
     WHERE DailyCOVID19Reports_small.countryId = Country_small.countryId AND date = covid_date
     ORDER BY numRecovered DESC;
   END IF;
 END;
 //
 DROP PROCEDURE IF EXISTS small_CovidByCountry //
 CREATE PROCEDURE small_CovidByCountry(IN covid_date VARCHAR(40), country VARCHAR(40))
 BEGIN
   SELECT Country_small.name, DailyCOVID19Reports_small.numConfirmed, DailyCOVID19Reports_small.numDeaths, DailyCOVID19Reports_small.numRecovered
   FROM DailyCOVID19Reports_small, Country_small
   WHERE DailyCOVID19Reports_small.countryId = Country_small.countryId AND date = covid_date AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_CovidTimeSeries //
 CREATE PROCEDURE small_CovidTimeSeries(IN country VARCHAR(40))
 BEGIN
   SELECT DailyCOVID19Reports_small.date, DailyCOVID19Reports_small.numConfirmed, DailyCOVID19Reports_small.numDeaths, DailyCOVID19Reports_small.numRecovered
   FROM DailyCOVID19Reports_small, Country_small
   WHERE DailyCOVID19Reports_small.countryId = Country_small.countryId AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_PopulationByCountry //
 CREATE PROCEDURE small_PopulationByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Population_small.estPopSize,
    Population_small.popDensity,
    Population_small.rateIncrease,
    Population_small.lifeExpectancy,
    Population_small.mortalityRate,
    Population_small.fertilityRate,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Population_small, Country_small, DailyCOVID19Reports_small
   WHERE Population_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_EducationByCountry //
 CREATE PROCEDURE small_EducationByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Education_small.totalPublicExp,
    Education_small.primaryEdPercent,
    Education_small.secondaryEdPercent,
    Education_small.tertiaryEdPercent,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Education_small, Country_small, DailyCOVID19Reports_small
   WHERE Education_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_LaborForceByCountry //
 CREATE PROCEDURE small_LaborForceByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    LaborForce_small.laborForceParticipationRate,
    LaborForce_small.unemploymentRate,
    LaborForce_small.percentEmplAgriculture,
    LaborForce_small.percentEmplIndustry,
    LaborForce_small.percentEmplServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM LaborForce_small, Country_small, DailyCOVID19Reports_small
   WHERE LaborForce_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_TravelByCountry //
 CREATE PROCEDURE small_TravelByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Travel_small.migrantPercentOfPop,
    Travel_small.numRefugeesAndAsylum,
    Travel_small.tourismExp,
    Travel_small.numTourists,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Travel_small, Country_small, DailyCOVID19Reports_small
   WHERE Travel_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_HealthByCountry //
 CREATE PROCEDURE small_HealthByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Health_small.healthExp,
    Health_small.physiciansPer1000,
    Health_small.popUsingSafeSanitationFacilities,
    Health_small.popUsingSafeWaterServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Health_small, Country_small, DailyCOVID19Reports_small
   WHERE Health_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_GDPByCountry //
 CREATE PROCEDURE small_GDPByCountry(country VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    GDP_small.gdp,
    GDP_small.gdpPerCapita,
    GDP_small.rdGDPExp,
    GDP_small.healthGDPExp,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM GDP_small, Country_small, DailyCOVID19Reports_small
   WHERE GDP_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'
      AND Country_small.name = country;
 END;
 //
 DROP PROCEDURE IF EXISTS small_PopulationCovid //
 CREATE PROCEDURE small_PopulationCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Population_small.estPopSize,
    Population_small.popDensity,
    Population_small.rateIncrease,
    Population_small.lifeExpectancy,
    Population_small.mortalityRate,
    Population_small.fertilityRate,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM Population_small, Country_small, DailyCOVID19Reports_small
   WHERE Population_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_EducationCovid //
 CREATE PROCEDURE small_EducationCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Education_small.totalPublicExp,
    Education_small.primaryEdPercent,
    Education_small.secondaryEdPercent,
    Education_small.tertiaryEdPercent,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM Education_small, Country_small, DailyCOVID19Reports_small
   WHERE Education_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_LaborForceCovid //
 CREATE PROCEDURE small_LaborForceCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    LaborForce_small.laborForceParticipationRate,
    LaborForce_small.unemploymentRate,
    LaborForce_small.percentEmplAgriculture,
    LaborForce_small.percentEmplIndustry,
    LaborForce_small.percentEmplServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM LaborForce_small, Country_small, DailyCOVID19Reports_small
   WHERE LaborForce_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_TravelCovid //
 CREATE PROCEDURE small_TravelCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Travel_small.migrantPercentOfPop,
    Travel_small.numRefugeesAndAsylum,
    Travel_small.tourismExp,
    Travel_small.numTourists,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Travel_small, Country_small, DailyCOVID19Reports_small
   WHERE Travel_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_HealthCovid //
 CREATE PROCEDURE small_HealthCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Health_small.healthExp,
    Health_small.physiciansPer1000,
    Health_small.popUsingSafeSanitationFacilities,
    Health_small.popUsingSafeWaterServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Health_small, Country_small, DailyCOVID19Reports_small
   WHERE Health_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_GDPCovid //
 CREATE PROCEDURE small_GDPCovid(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    GDP_small.gdp,
    GDP_small.gdpPerCapita,
    GDP_small.rdGDPExp,
    GDP_small.healthGDPExp,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM GDP_small, Country_small, DailyCOVID19Reports_small
   WHERE GDP_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numConfirmed') THEN DailyCOVID19Reports_small.numConfirmed END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numDeaths') THEN DailyCOVID19Reports_small.numDeaths END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRecovered') THEN DailyCOVID19Reports_small.numRecovered END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_PopulationThree //
 CREATE PROCEDURE small_PopulationThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Population_small.estPopSize,
    Population_small.popDensity,
    Population_small.rateIncrease,
    Population_small.lifeExpectancy,
    Population_small.mortalityRate,
    Population_small.fertilityRate,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM Population_small, Country_small, DailyCOVID19Reports_small
   WHERE Population_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'estPopSize') THEN Population_small.estPopSize END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'estPopSize') THEN Population_small.estPopSize END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'popDensity') THEN Population_small.popDensity END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'popDensity') THEN Population_small.popDensity END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'rateIncrease') THEN Population_small.rateIncrease END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'rateIncrease') THEN Population_small.rateIncrease END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'lifeExpectancy') THEN Population_small.lifeExpectancy END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'lifeExpectancy') THEN Population_small.lifeExpectancy END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'mortalityRate') THEN Population_small.mortalityRate END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'mortalityRate') THEN Population_small.mortalityRate END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'fertilityRate') THEN Population_small.fertilityRate END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'fertilityRate') THEN Population_small.fertilityRate END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_EducationThree //
 CREATE PROCEDURE small_EducationThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Education_small.totalPublicExp,
    Education_small.primaryEdPercent,
    Education_small.secondaryEdPercent,
    Education_small.tertiaryEdPercent,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM Education_small, Country_small, DailyCOVID19Reports_small
   WHERE Education_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'totalPublicExp') THEN Education_small.totalPublicExp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'totalPublicExp') THEN Education_small.totalPublicExp END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'primaryEdPercent') THEN Education_small.primaryEdPercent END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'primaryEdPercent') THEN Education_small.primaryEdPercent END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'secondaryEdPercent') THEN Education_small.secondaryEdPercent END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'secondaryEdPercent') THEN Education_small.secondaryEdPercent END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'tertiaryEdPercent') THEN Education_small.tertiaryEdPercent END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'tertiaryEdPercent') THEN Education_small.tertiaryEdPercent END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_LaborForceThree //
 CREATE PROCEDURE small_LaborForceThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    LaborForce_small.laborForceParticipationRate,
    LaborForce_small.unemploymentRate,
    LaborForce_small.percentEmplAgriculture,
    LaborForce_small.percentEmplIndustry,
    LaborForce_small.percentEmplServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered

   FROM LaborForce_small, Country_small, DailyCOVID19Reports_small
   WHERE LaborForce_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'laborForceParticipationRate') THEN LaborForce_small.laborForceParticipationRate END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'laborForceParticipationRate') THEN LaborForce_small.laborForceParticipationRate END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'unemploymentRate') THEN LaborForce_small.unemploymentRate END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'unemploymentRate') THEN LaborForce_small.unemploymentRate END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'percentEmplAgriculture') THEN LaborForce_small.percentEmplAgriculture END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'percentEmplAgriculture') THEN LaborForce_small.percentEmplAgriculture END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'percentEmplIndustry') THEN LaborForce_small.percentEmplIndustry END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'percentEmplIndustry') THEN LaborForce_small.percentEmplIndustry END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'percentEmplServices') THEN LaborForce_small.percentEmplServices END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'percentEmplServices') THEN LaborForce_small.percentEmplServices END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_TravelThree //
 CREATE PROCEDURE small_TravelThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Travel_small.migrantPercentOfPop,
    Travel_small.numRefugeesAndAsylum,
    Travel_small.tourismExp,
    Travel_small.numTourists,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Travel_small, Country_small, DailyCOVID19Reports_small
   WHERE Travel_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'migrantPercentOfPop') THEN Travel_small.migrantPercentOfPop END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'migrantPercentOfPop') THEN Travel_small.migrantPercentOfPop END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numRefugeesAndAsylum') THEN Travel_small.numRefugeesAndAsylum END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numRefugeesAndAsylum') THEN Travel_small.numRefugeesAndAsylum END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'tourismExp') THEN Travel_small.tourismExp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'tourismExp') THEN Travel_small.tourismExp END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'numTourists') THEN Travel_small.numTourists END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'numTourists') THEN Travel_small.numTourists END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_HealthThree //
 CREATE PROCEDURE small_HealthThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    Health_small.healthExp,
    Health_small.physiciansPer1000,
    Health_small.popUsingSafeSanitationFacilities,
    Health_small.popUsingSafeWaterServices,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM Health_small, Country_small, DailyCOVID19Reports_small
   WHERE Health_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'healthExp') THEN Health_small.healthExp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'healthExp') THEN Health_small.healthExp END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'physiciansPer1000') THEN Health_small.physiciansPer1000 END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'physiciansPer1000') THEN Health_small.physiciansPer1000 END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'popUsingSafeSanitationFacilities') THEN Health_small.popUsingSafeSanitationFacilities END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'popUsingSafeSanitationFacilities') THEN Health_small.popUsingSafeSanitationFacilities END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'popUsingSafeWaterServices') THEN Health_small.popUsingSafeWaterServices END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'popUsingSafeWaterServices') THEN Health_small.popUsingSafeWaterServices END ASC

   LIMIT num;
 END;
 //
 DROP PROCEDURE IF EXISTS small_GDPThree //
 CREATE PROCEDURE small_GDPThree(topbottom VARCHAR(10), num SMALLINT, attribute VARCHAR(40))
 BEGIN
   SELECT Country_small.name,
    GDP_small.gdp,
    GDP_small.gdpPerCapita,
    GDP_small.rdGDPExp,
    GDP_small.healthGDPExp,
    DailyCOVID19Reports_small.numConfirmed,
    DailyCOVID19Reports_small.numDeaths,
    DailyCOVID19Reports_small.numRecovered
   FROM GDP_small, Country_small, DailyCOVID19Reports_small
   WHERE GDP_small.countryId = Country_small.countryId
    AND DailyCOVID19Reports_small.countryId = Country_small.countryId
     AND DailyCOVID19Reports_small.date = '2020-05-08'

   ORDER BY
   CASE WHEN (topbottom = 'top' AND attribute = 'gdp') THEN GDP_small.gdp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'gdp') THEN GDP_small.gdp END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'gdpPerCapita') THEN GDP_small.gdpPerCapita END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'gdpPerCapita') THEN GDP_small.gdpPerCapita END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'rdGDPExp') THEN GDP_small.rdGDPExp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'rdGDPExp') THEN GDP_small.rdGDPExp END ASC,
   CASE WHEN (topbottom = 'top' AND attribute = 'healthGDPExp') THEN GDP_small.healthGDPExp END DESC,
   CASE WHEN (topbottom  = 'bottom' AND attribute = 'healthGDPExp') THEN GDP_small.healthGDPExp END ASC

   LIMIT num;
 END;
 //
 delimiter ;
