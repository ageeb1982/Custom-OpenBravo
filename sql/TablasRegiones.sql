CREATE TABLE C_Currency(
  C_Currency_id CHARACTER VARYING NOT NULL,
  IsActive CHARACTER(1) NOT NULL DEFAULT 'Y'::bpchar,
  Iso_Code CHARACTER(3) NOT NULL,
  CurSymbol CHARACTER VARYING(10),
  Description CHARACTER VARYING(255) NOT NULL,
  StdPrecision NUMERIC(10,0) NOT NULL,
  CostingPrecision NUMERIC(10,0) NOT NULL,
  CONSTRAINT PK_C_Currency PRIMARY KEY (C_Currency_id),
  CONSTRAINT CH_C_Currency_IsActive CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

SELECT 
	C_Currency_ID,
	Iso_Code,
	Description,
	StdPrecision,
	CostingPrecision,
	CurSymbol
FROM C_Currency
LIMIT 1;

CREATE TABLE C_Country(
  C_Country_ID CHARACTER VARYING NOT NULL,
  IsActive CHARACTER(1) NOT NULL DEFAULT 'Y'::bpchar,
  Name CHARACTER VARYING(60) NOT NULL,
  Description CHARACTER VARYING(255),
  CountryCode CHARACTER(2) NOT NULL,
  HasRegion CHARACTER(1) NOT NULL DEFAULT 'N'::bpchar,
  RegionName CHARACTER VARYING(60),
  C_Currency_ID CHARACTER VARYING,
  CONSTRAINT PK_C_Country PRIMARY KEY (C_Country_ID),
  CONSTRAINT FK_C_Country_C_Country FOREIGN KEY (C_Country_ID)
      REFERENCES C_Country (C_Country_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT FK_C_Country_C_Currency FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT CH_C_Country_HasRegion CHECK (HasRegion = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT CH_C_Country_IsActive CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

SELECT 
	C_Country_ID,
	Name,
	Description,
	CountryCode,
	C_Currency_ID,
	IsActive
FROM C_Country 
LIMIT 1;

CREATE TABLE C_Region
(
  C_Region_ID CHARACTER VARYING NOT NULL,
  IsActive CHARACTER(1) NOT NULL DEFAULT 'Y'::bpchar,
  Name CHARACTER VARYING(60) NOT NULL,
  Description CHARACTER VARYING(255),
  C_Country_ID CHARACTER VARYING NOT NULL,
  IsDefault CHARACTER(1) DEFAULT 'N'::bpchar,
  CONSTRAINT PK_C_Region PRIMARY KEY (C_Region_ID),
  CONSTRAINT FK_C_Country_C_Region FOREIGN KEY (C_Country_ID)
      REFERENCES C_Country (C_Country_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT CH_C_Region_IsActive CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT CH_C_Region_IsDefault CHECK (IsDefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);


SELECT 
	C_Country_ID,
	C_Region_ID,
	Name,
	Description,
	IsDefault,
	IsActive
FROM C_Region
LIMIT 1;

CREATE TABLE C_City
(
  C_City_ID CHARACTER VARYING NOT NULL,
  IsActive CHARACTER(1) NOT NULL DEFAULT 'Y'::bpchar,
  Name CHARACTER VARYING(60) NOT NULL,
  Postal CHARACTER VARYING(10),
  AreaCode CHARACTER VARYING(10),
  C_Region_ID CHARACTER VARYING NOT NULL,
  CONSTRAINT PK_C_City PRIMARY KEY (C_City_ID),
  CONSTRAINT FK_C_Region_C_City FOREIGN KEY (C_Region_ID)
      REFERENCES C_Region (C_Region_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT CH_C_City_IsActive CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

SELECT 
	C_Region_ID,
	C_City_ID,
	Name,
	Postal,
	AreaCode,
	IsActive
FROM C_City;
