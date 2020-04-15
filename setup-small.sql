DROP TABLE IF EXISTS Country_small;
CREATE TABLE Country_small (
  countryId INTEGER NOT NULL,
  name VARCHAR(40) NOT NULL,
  PRIMARY KEY (countryId)
);

DROP TABLE IF EXISTS DailyCOVID19Reports_small;
CREATE TABLE DailyCOVID19Reports_small (
  countryId INTEGER NOT NULL,
  date DATE NOT NULL,
  numConfirmed INTEGER,
  numDeaths INTEGER,
  numRecovered INTEGER,
  PRIMARY KEY (countryId, date),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

DROP TABLE IF EXISTS Population_small;
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

DROP TABLE IF EXISTS Education_small;
CREATE TABLE Education_small (
  countryId INTEGER NOT NULL,
  totalPublicExp NUMERIC(3, 1),
  primaryEdPercent NUMERIC(3, 1),
  secondaryEdPercent NUMERIC(3, 1),
  tertiaryEdPercent NUMERIC(3, 1),
  PRIMARY KEY (countryId),
  FOREIGN KEY (countryId) REFERENCES Country_small (countryId)
);

DROP TABLE IF EXISTS LaborForce_small;
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
