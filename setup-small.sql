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
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES;

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

LOAD DATA LOCAL INFILE './small_relation_data/dailyCOVID19-small.txt'
 INTO TABLE DailyCOVID19Reports_small
 FIELDS TERMINATED BY ' '
 IGNORE 1 LINES;

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
