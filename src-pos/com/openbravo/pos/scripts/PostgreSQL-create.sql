
/* Drop Indexes */

DROP INDEX IF EXISTS attuse_line;
DROP INDEX IF EXISTS closedcash_inx_seq;
DROP INDEX IF EXISTS closedcash_inx_1;
DROP INDEX IF EXISTS customers_card_inx;
DROP INDEX IF EXISTS customers_name_inx;
DROP INDEX IF EXISTS customers_taxid_inx;
DROP INDEX IF EXISTS payments_inx_1;
DROP INDEX IF EXISTS people_card_inx;
DROP INDEX IF EXISTS products_cat_inx_1;
DROP INDEX IF EXISTS pcom_inx_prod;
DROP INDEX IF EXISTS receipts_inx_1;
DROP INDEX IF EXISTS reservations_inx_1;
DROP INDEX IF EXISTS stockcurrent_inx;
DROP INDEX IF EXISTS stockdiary_inx_1;
DROP INDEX IF EXISTS tickets_ticketid;



/* Drop Tables */

DROP TABLE IF EXISTS public.reservation_customers;
DROP TABLE IF EXISTS public.ticketlines;
DROP TABLE IF EXISTS public.tickets;
DROP TABLE IF EXISTS public.Customers;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS public.attributeinstance;
DROP TABLE IF EXISTS public.attributeuse;
DROP TABLE IF EXISTS public.attributevalue;
DROP TABLE IF EXISTS public.attribute;
DROP TABLE IF EXISTS public.stockcurrent;
DROP TABLE IF EXISTS public.stockdiary;
DROP TABLE IF EXISTS public.attributesetinstance;
DROP TABLE IF EXISTS public.products_cat;
DROP TABLE IF EXISTS public.products_com;
DROP TABLE IF EXISTS public.stocklevel;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.attributeset;
DROP TABLE IF EXISTS public.categories;
DROP TABLE IF EXISTS public.payments;
DROP TABLE IF EXISTS public.taxlines;
DROP TABLE IF EXISTS public.receipts;
DROP TABLE IF EXISTS public.closedcash;
DROP TABLE IF EXISTS public.locations;
DROP TABLE IF EXISTS public.people;
DROP TABLE IF EXISTS public.Applications;
DROP TABLE IF EXISTS public.PLACES;
DROP TABLE IF EXISTS public.FLOORS;
DROP TABLE IF EXISTS public.Resources;
DROP TABLE IF EXISTS public.reservations;
DROP TABLE IF EXISTS public.roles;
DROP TABLE IF EXISTS public.sharedtickets;
DROP TABLE IF EXISTS public.taxes;
DROP TABLE IF EXISTS public.taxcategories;
DROP TABLE IF EXISTS public.taxcustcategories;
DROP TABLE IF EXISTS public.thirdparties;



/* Drop Sequences */

DROP SEQUENCE IF EXISTS public.ticketsnum;
DROP SEQUENCE IF EXISTS public.ticketsnum_payment;
DROP SEQUENCE IF EXISTS public.ticketsnum_refund;




/* Create Sequences */

CREATE SEQUENCE public.ticketsnum INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE SEQUENCE public.ticketsnum_payment INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE SEQUENCE public.ticketsnum_refund INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;



/* Create Tables */

-- City
CREATE TABLE City
(
	-- City_ID
	City_ID varchar NOT NULL,
	-- Country_ID
	Country_ID varchar NOT NULL,
	-- Region_ID
	Region_ID varchar NOT NULL,
	-- IsActive
	IsActive char(1),
	-- Name
	Name varchar,
	-- LoCode
	LoCode varchar(10),
	-- AreaCode
	AreaCode varchar(10),
	PRIMARY KEY (City_ID)
) WITHOUT OIDS;


-- Country
CREATE TABLE Country
(
	-- Country_ID
	Country_ID varchar NOT NULL,
	-- IsActive
	IsActive char(1),
	-- Name
	Name varchar NOT NULL,
	-- Description
	Description varchar(255),
	-- CountryCode
	CountryCode char(2),
	-- IsHasRegion
	IsHasRegion char(1),
	-- RegionName
	RegionName varchar,
	PRIMARY KEY (Country_ID)
) WITHOUT OIDS;


-- Region
CREATE TABLE Region
(
	-- Region_ID
	Region_ID varchar NOT NULL,
	-- Country_ID
	Country_ID varchar NOT NULL,
	-- IsActive
	IsActive char(1),
	-- Name
	Name varchar,
	-- Description
	Description varchar(255),
	-- IsDefault
	IsDefault char(1),
	PRIMARY KEY (Region_ID)
) WITHOUT OIDS;


-- attribute
CREATE TABLE public.attribute
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL,
	CONSTRAINT attribute_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- attributeinstance
CREATE TABLE public.attributeinstance
(
	-- id
	id varchar NOT NULL,
	-- attributesetinstance_id
	attributesetinstance_id varchar NOT NULL,
	-- attribute_id
	attribute_id varchar NOT NULL,
	-- value
	value varchar,
	CONSTRAINT attributeinstance_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- attributeset
CREATE TABLE public.attributeset
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL,
	CONSTRAINT attributeset_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- attributesetinstance
CREATE TABLE public.attributesetinstance
(
	-- id
	id varchar NOT NULL,
	-- attributeset_id
	attributeset_id varchar NOT NULL,
	-- description
	description varchar,
	CONSTRAINT attributesetinstance_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- attributeuse
CREATE TABLE public.attributeuse
(
	-- id
	id varchar NOT NULL,
	-- attributeset_id
	attributeset_id varchar NOT NULL,
	-- attribute_id
	attribute_id varchar NOT NULL,
	-- lineno
	lineno int,
	CONSTRAINT attributeuse_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- attributevalue
CREATE TABLE public.attributevalue
(
	-- id
	id varchar NOT NULL,
	-- attribute_id
	attribute_id varchar NOT NULL,
	-- value
	value varchar,
	CONSTRAINT attributevalue_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- categories
CREATE TABLE public.categories
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- parentid
	parentid varchar,
	-- Image
	Image bytea,
	CONSTRAINT categories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- closedcash
CREATE TABLE public.closedcash
(
	-- money
	money varchar NOT NULL,
	-- host
	host varchar NOT NULL,
	-- hostsequence
	hostsequence int NOT NULL,
	-- datestart
	datestart timestamp NOT NULL,
	-- dateend
	dateend timestamp,
	CONSTRAINT closedcash_pkey PRIMARY KEY (money)
) WITHOUT OIDS;


-- Customers
CREATE TABLE public.Customers
(
	-- Customers_ID
	Customers_ID varchar NOT NULL,
	-- SearchKey
	SearchKey varchar NOT NULL UNIQUE,
	-- TaxID
	TaxID varchar(20),
	-- Name
	Name varchar NOT NULL,
	-- TaxCategory
	TaxCategory varchar,
	-- Card
	Card varchar,
	-- MaxDebt
	MaxDebt float DEFAULT 0 NOT NULL,
	-- Address
	Address varchar,
	-- Address2
	Address2 varchar,
	-- Postal
	Postal varchar,
	-- FirstName
	FirstName varchar(60),
	-- LastName
	LastName varchar(60),
	-- Email
	Email varchar,
	-- Phone
	Phone varchar,
	-- Phone2
	Phone2 varchar,
	-- Fax
	Fax varchar,
	-- Notes
	Notes varchar,
	-- IsVisible
	IsVisible boolean DEFAULT 'true' NOT NULL,
	-- CurDate
	CurDate timestamp,
	-- CurDebt
	CurDebt float,
	-- Country_ID
	Country_ID varchar NOT NULL,
	-- City_ID
	City_ID varchar NOT NULL,
	-- Region_ID
	Region_ID varchar NOT NULL,
	-- Processing
	Processing char(1),
	CONSTRAINT customers_pkey PRIMARY KEY (Customers_ID)
) WITHOUT OIDS;


-- locations
CREATE TABLE public.locations
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- Address
	Address varchar,
	CONSTRAINT locations_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- payments
CREATE TABLE public.payments
(
	-- id
	id varchar NOT NULL,
	-- receipt
	receipt varchar NOT NULL,
	-- payment
	payment varchar NOT NULL,
	-- total
	total float NOT NULL,
	-- transid
	transid varchar,
	-- returnmsg
	returnmsg bytea,
	CONSTRAINT payments_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- people
CREATE TABLE public.people
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- apppassword
	apppassword varchar,
	-- Card
	Card varchar,
	-- role
	role varchar NOT NULL,
	-- IsVisible
	IsVisible boolean NOT NULL,
	-- Image
	Image bytea,
	CONSTRAINT people_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- Applications
CREATE TABLE public.Applications
(
	-- Applications_ID
	Applications_ID varchar NOT NULL,
	-- Name
	Name varchar NOT NULL,
	-- Version
	Version varchar NOT NULL,
	CONSTRAINT applications_pkey PRIMARY KEY (Applications_ID)
) WITHOUT OIDS;


-- FLOORS
CREATE TABLE public.FLOORS
(
	-- FLOORS_ID
	FLOORS_ID varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- Image
	Image bytea,
	CONSTRAINT floors_pkey PRIMARY KEY (FLOORS_ID)
) WITHOUT OIDS;


-- PLACES
CREATE TABLE public.PLACES
(
	-- PLACES_ID
	PLACES_ID varchar NOT NULL,
	-- FLOORS_ID
	FLOORS_ID varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- X
	X int NOT NULL,
	-- Y
	Y int NOT NULL,
	CONSTRAINT places_pkey PRIMARY KEY (PLACES_ID)
) WITHOUT OIDS;


-- Resources
CREATE TABLE public.Resources
(
	-- Resources_ID
	Resources_ID varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- ResourcesType
	ResourcesType int NOT NULL,
	-- ResourceContent
	ResourceContent bytea,
	CONSTRAINT resources_pkey PRIMARY KEY (Resources_ID)
) WITHOUT OIDS;


-- products
CREATE TABLE public.products
(
	-- id
	id varchar NOT NULL,
	-- reference
	reference varchar NOT NULL UNIQUE,
	-- code
	code varchar NOT NULL UNIQUE,
	-- codetype
	codetype varchar,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- pricebuy
	pricebuy float NOT NULL,
	-- pricesell
	pricesell float NOT NULL,
	-- category
	category varchar NOT NULL,
	-- taxcat
	taxcat varchar NOT NULL,
	-- attributeset_id
	attributeset_id varchar,
	-- stockcost
	stockcost float,
	-- stockvolume
	stockvolume float,
	-- Image
	Image bytea,
	-- iscom
	iscom boolean DEFAULT 'false' NOT NULL,
	-- isscale
	isscale boolean DEFAULT 'false' NOT NULL,
	-- attributes
	attributes bytea,
	CONSTRAINT products_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- products_cat
CREATE TABLE public.products_cat
(
	-- product
	product varchar NOT NULL,
	-- catorder
	catorder int,
	CONSTRAINT products_cat_pkey PRIMARY KEY (product)
) WITHOUT OIDS;


-- products_com
CREATE TABLE public.products_com
(
	-- id
	id varchar NOT NULL,
	-- product
	product varchar NOT NULL,
	-- product2
	product2 varchar NOT NULL,
	CONSTRAINT products_com_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- receipts
CREATE TABLE public.receipts
(
	-- id
	id varchar NOT NULL,
	-- money
	money varchar NOT NULL,
	-- datenew
	datenew timestamp NOT NULL,
	-- attributes
	attributes bytea,
	CONSTRAINT receipts_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- reservations
CREATE TABLE public.reservations
(
	-- id
	id varchar NOT NULL,
	-- created
	created timestamp NOT NULL,
	-- datenew
	datenew timestamp DEFAULT '2001-01-01 00:00:00'::timestamp without time zone NOT NULL,
	-- title
	title varchar NOT NULL,
	-- chairs
	chairs int NOT NULL,
	-- isdone
	isdone boolean NOT NULL,
	-- description
	description varchar,
	CONSTRAINT reservations_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- reservation_customers
CREATE TABLE public.reservation_customers
(
	-- id
	id varchar NOT NULL,
	-- Customers_ID
	Customers_ID varchar NOT NULL,
	CONSTRAINT reservation_customers_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- roles
CREATE TABLE public.roles
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- permissions
	permissions bytea,
	CONSTRAINT roles_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- sharedtickets
CREATE TABLE public.sharedtickets
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL,
	-- ResourceContent
	ResourceContent bytea,
	CONSTRAINT sharedtickets_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- stockcurrent
CREATE TABLE public.stockcurrent
(
	-- location
	location varchar NOT NULL,
	-- product
	product varchar NOT NULL,
	-- attributesetinstance_id
	attributesetinstance_id varchar,
	-- units
	units float NOT NULL
) WITHOUT OIDS;


-- stockdiary
CREATE TABLE public.stockdiary
(
	-- id
	id varchar NOT NULL,
	-- datenew
	datenew timestamp NOT NULL,
	-- reason
	reason int NOT NULL,
	-- location
	location varchar NOT NULL,
	-- product
	product varchar NOT NULL,
	-- attributesetinstance_id
	attributesetinstance_id varchar,
	-- units
	units float NOT NULL,
	-- price
	price float NOT NULL,
	CONSTRAINT stockdiary_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- stocklevel
CREATE TABLE public.stocklevel
(
	-- id
	id varchar NOT NULL,
	-- location
	location varchar NOT NULL,
	-- product
	product varchar NOT NULL,
	-- stocksecurity
	stocksecurity float,
	-- stockmaximum
	stockmaximum float,
	CONSTRAINT stocklevel_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- taxcategories
CREATE TABLE public.taxcategories
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	CONSTRAINT taxcategories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- taxcustcategories
CREATE TABLE public.taxcustcategories
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	CONSTRAINT taxcustcategories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- taxes
CREATE TABLE public.taxes
(
	-- id
	id varchar NOT NULL,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- validfrom
	validfrom timestamp DEFAULT '2001-01-01 00:00:00'::timestamp without time zone NOT NULL,
	-- category
	category varchar NOT NULL,
	-- custcategory
	custcategory varchar,
	-- parentid
	parentid varchar,
	-- rate
	rate float NOT NULL,
	-- ratecascade
	ratecascade boolean DEFAULT 'false' NOT NULL,
	-- rateorder
	rateorder int,
	CONSTRAINT taxes_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- taxlines
CREATE TABLE public.taxlines
(
	-- id
	id varchar NOT NULL,
	-- receipt
	receipt varchar NOT NULL,
	-- taxid
	taxid varchar NOT NULL,
	-- base
	base float NOT NULL,
	-- amount
	amount float NOT NULL,
	CONSTRAINT taxlines_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- thirdparties
CREATE TABLE public.thirdparties
(
	-- id
	id varchar NOT NULL,
	-- cif
	cif varchar NOT NULL UNIQUE,
	-- Name
	Name varchar NOT NULL UNIQUE,
	-- Address
	Address varchar,
	-- contactcomm
	contactcomm varchar,
	-- contactfact
	contactfact varchar,
	-- payrule
	payrule varchar,
	-- faxnumber
	faxnumber varchar,
	-- phonenumber
	phonenumber varchar,
	-- mobilenumber
	mobilenumber varchar,
	-- Email
	Email varchar,
	-- webpage
	webpage varchar,
	-- Notes
	Notes varchar,
	CONSTRAINT thirdparties_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


-- ticketlines
CREATE TABLE public.ticketlines
(
	-- ticket
	ticket varchar NOT NULL,
	-- line
	line int NOT NULL,
	-- product
	product varchar,
	-- attributesetinstance_id
	attributesetinstance_id varchar,
	-- units
	units float NOT NULL,
	-- price
	price float NOT NULL,
	-- taxid
	taxid varchar NOT NULL,
	-- attributes
	attributes bytea,
	CONSTRAINT ticketlines_pkey PRIMARY KEY (ticket, line)
) WITHOUT OIDS;


-- tickets
CREATE TABLE public.tickets
(
	-- id
	id varchar NOT NULL,
	-- tickettype
	tickettype int DEFAULT 0 NOT NULL,
	-- ticketid
	ticketid int NOT NULL,
	-- person
	person varchar NOT NULL,
	-- status
	status int DEFAULT 0 NOT NULL,
	-- Customers_ID
	Customers_ID varchar NOT NULL,
	CONSTRAINT tickets_pkey PRIMARY KEY (id)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE public.Customers
	ADD FOREIGN KEY (City_ID)
	REFERENCES City (City_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE City
	ADD FOREIGN KEY (Country_ID)
	REFERENCES Country (Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Region
	ADD FOREIGN KEY (Country_ID)
	REFERENCES Country (Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.Customers
	ADD FOREIGN KEY (Country_ID)
	REFERENCES Country (Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE City
	ADD FOREIGN KEY (Region_ID)
	REFERENCES Region (Region_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.Customers
	ADD FOREIGN KEY (Region_ID)
	REFERENCES Region (Region_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.attributeinstance
	ADD CONSTRAINT attinst_att FOREIGN KEY (attribute_id)
	REFERENCES public.attribute (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.attributeuse
	ADD CONSTRAINT attuse_att FOREIGN KEY (attribute_id)
	REFERENCES public.attribute (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.attributevalue
	ADD CONSTRAINT attval_att FOREIGN KEY (attribute_id)
	REFERENCES public.attribute (id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
;


ALTER TABLE public.attributesetinstance
	ADD CONSTRAINT attsetinst_set FOREIGN KEY (attributeset_id)
	REFERENCES public.attributeset (id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
;


ALTER TABLE public.attributeuse
	ADD CONSTRAINT attuse_set FOREIGN KEY (attributeset_id)
	REFERENCES public.attributeset (id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
;


ALTER TABLE public.products
	ADD CONSTRAINT products_attrset_fk FOREIGN KEY (attributeset_id)
	REFERENCES public.attributeset (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.attributeinstance
	ADD CONSTRAINT attinst_set FOREIGN KEY (attributesetinstance_id)
	REFERENCES public.attributesetinstance (id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
;


ALTER TABLE public.stockcurrent
	ADD CONSTRAINT stockcurrent_attsetinst FOREIGN KEY (attributesetinstance_id)
	REFERENCES public.attributesetinstance (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stockdiary
	ADD CONSTRAINT stockdiary_attsetinst FOREIGN KEY (attributesetinstance_id)
	REFERENCES public.attributesetinstance (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.ticketlines
	ADD CONSTRAINT ticketlines_attsetinst FOREIGN KEY (attributesetinstance_id)
	REFERENCES public.attributesetinstance (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.categories
	ADD CONSTRAINT categories_fk_1 FOREIGN KEY (parentid)
	REFERENCES public.categories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.products
	ADD CONSTRAINT products_fk_1 FOREIGN KEY (category)
	REFERENCES public.categories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.receipts
	ADD CONSTRAINT receipts_fk_money FOREIGN KEY (money)
	REFERENCES public.closedcash (money)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.reservation_customers
	ADD CONSTRAINT res_cust_fk_2 FOREIGN KEY (Customers_ID)
	REFERENCES public.Customers (Customers_ID)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.tickets
	ADD CONSTRAINT tickets_customers_fk FOREIGN KEY (Customers_ID)
	REFERENCES public.Customers (Customers_ID)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stockcurrent
	ADD CONSTRAINT stockcurrent_fk_2 FOREIGN KEY (location)
	REFERENCES public.locations (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stockdiary
	ADD CONSTRAINT stockdiary_fk_2 FOREIGN KEY (location)
	REFERENCES public.locations (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stocklevel
	ADD CONSTRAINT stocklevel_location FOREIGN KEY (location)
	REFERENCES public.locations (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.tickets
	ADD CONSTRAINT tickets_fk_2 FOREIGN KEY (person)
	REFERENCES public.people (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.PLACES
	ADD CONSTRAINT places_fk_1 FOREIGN KEY (FLOORS_ID)
	REFERENCES public.FLOORS (FLOORS_ID)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.products_cat
	ADD CONSTRAINT products_cat_fk_1 FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.products_com
	ADD CONSTRAINT products_com_fk_1 FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.products_com
	ADD CONSTRAINT products_com_fk_2 FOREIGN KEY (product2)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stockcurrent
	ADD CONSTRAINT stockcurrent_fk_1 FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stockdiary
	ADD CONSTRAINT stockdiary_fk_1 FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.stocklevel
	ADD CONSTRAINT stocklevel_product FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.ticketlines
	ADD CONSTRAINT ticketlines_fk_2 FOREIGN KEY (product)
	REFERENCES public.products (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.payments
	ADD CONSTRAINT payments_fk_receipt FOREIGN KEY (receipt)
	REFERENCES public.receipts (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.taxlines
	ADD CONSTRAINT taxlines_receipt FOREIGN KEY (receipt)
	REFERENCES public.receipts (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.tickets
	ADD CONSTRAINT tickets_fk_id FOREIGN KEY (id)
	REFERENCES public.receipts (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.reservation_customers
	ADD CONSTRAINT res_cust_fk_1 FOREIGN KEY (id)
	REFERENCES public.reservations (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.people
	ADD CONSTRAINT people_fk_1 FOREIGN KEY (role)
	REFERENCES public.roles (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.products
	ADD CONSTRAINT products_taxcat_fk FOREIGN KEY (taxcat)
	REFERENCES public.taxcategories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.taxes
	ADD CONSTRAINT taxes_cat_fk FOREIGN KEY (category)
	REFERENCES public.taxcategories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.Customers
	ADD CONSTRAINT customers_taxcat FOREIGN KEY (TaxCategory)
	REFERENCES public.taxcustcategories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.taxes
	ADD CONSTRAINT taxes_custcat_fk FOREIGN KEY (custcategory)
	REFERENCES public.taxcustcategories (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.taxes
	ADD CONSTRAINT taxes_taxes_fk FOREIGN KEY (parentid)
	REFERENCES public.taxes (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.taxlines
	ADD CONSTRAINT taxlines_tax FOREIGN KEY (taxid)
	REFERENCES public.taxes (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.ticketlines
	ADD CONSTRAINT ticketlines_fk_3 FOREIGN KEY (taxid)
	REFERENCES public.taxes (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.ticketlines
	ADD CONSTRAINT ticketlines_fk_ticket FOREIGN KEY (ticket)
	REFERENCES public.tickets (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;



/* Create Indexes */

CREATE UNIQUE INDEX attuse_line ON public.attributeuse USING BTREE (attributeset_id, lineno);
CREATE UNIQUE INDEX closedcash_inx_seq ON public.closedcash USING BTREE (host, hostsequence);
CREATE INDEX closedcash_inx_1 ON public.closedcash USING BTREE (datestart);
CREATE INDEX customers_card_inx ON public.Customers USING BTREE (Card);
CREATE INDEX customers_name_inx ON public.Customers USING BTREE (Name);
CREATE INDEX customers_taxid_inx ON public.Customers USING BTREE (TaxID);
CREATE INDEX payments_inx_1 ON public.payments USING BTREE (payment);
CREATE INDEX people_card_inx ON public.people USING BTREE (Card);
CREATE INDEX products_cat_inx_1 ON public.products_cat USING BTREE (catorder);
CREATE UNIQUE INDEX pcom_inx_prod ON public.products_com USING BTREE (product, product2);
CREATE INDEX receipts_inx_1 ON public.receipts USING BTREE (datenew);
CREATE INDEX reservations_inx_1 ON public.reservations USING BTREE (datenew);
CREATE UNIQUE INDEX stockcurrent_inx ON public.stockcurrent USING BTREE (location, product, attributesetinstance_id);
CREATE INDEX stockdiary_inx_1 ON public.stockdiary USING BTREE (datenew);
CREATE INDEX tickets_ticketid ON public.tickets USING BTREE (tickettype, ticketid);



/* Comments */

COMMENT ON TABLE City IS 'City';
COMMENT ON COLUMN City.City_ID IS 'City_ID';
COMMENT ON COLUMN City.Country_ID IS 'Country_ID';
COMMENT ON COLUMN City.Region_ID IS 'Region_ID';
COMMENT ON COLUMN City.IsActive IS 'IsActive';
COMMENT ON COLUMN City.Name IS 'Name';
COMMENT ON COLUMN City.LoCode IS 'LoCode';
COMMENT ON COLUMN City.AreaCode IS 'AreaCode';
COMMENT ON TABLE Country IS 'Country';
COMMENT ON COLUMN Country.Country_ID IS 'Country_ID';
COMMENT ON COLUMN Country.IsActive IS 'IsActive';
COMMENT ON COLUMN Country.Name IS 'Name';
COMMENT ON COLUMN Country.Description IS 'Description';
COMMENT ON COLUMN Country.CountryCode IS 'CountryCode';
COMMENT ON COLUMN Country.IsHasRegion IS 'IsHasRegion';
COMMENT ON COLUMN Country.RegionName IS 'RegionName';
COMMENT ON TABLE Region IS 'Region';
COMMENT ON COLUMN Region.Region_ID IS 'Region_ID';
COMMENT ON COLUMN Region.Country_ID IS 'Country_ID';
COMMENT ON COLUMN Region.IsActive IS 'IsActive';
COMMENT ON COLUMN Region.Name IS 'Name';
COMMENT ON COLUMN Region.Description IS 'Description';
COMMENT ON COLUMN Region.IsDefault IS 'IsDefault';
COMMENT ON TABLE public.attribute IS 'attribute';
COMMENT ON COLUMN public.attribute.id IS 'id';
COMMENT ON COLUMN public.attribute.Name IS 'Name';
COMMENT ON TABLE public.attributeinstance IS 'attributeinstance';
COMMENT ON COLUMN public.attributeinstance.id IS 'id';
COMMENT ON COLUMN public.attributeinstance.attributesetinstance_id IS 'attributesetinstance_id';
COMMENT ON COLUMN public.attributeinstance.attribute_id IS 'attribute_id';
COMMENT ON COLUMN public.attributeinstance.value IS 'value';
COMMENT ON TABLE public.attributeset IS 'attributeset';
COMMENT ON COLUMN public.attributeset.id IS 'id';
COMMENT ON COLUMN public.attributeset.Name IS 'Name';
COMMENT ON TABLE public.attributesetinstance IS 'attributesetinstance';
COMMENT ON COLUMN public.attributesetinstance.id IS 'id';
COMMENT ON COLUMN public.attributesetinstance.attributeset_id IS 'attributeset_id';
COMMENT ON COLUMN public.attributesetinstance.description IS 'description';
COMMENT ON TABLE public.attributeuse IS 'attributeuse';
COMMENT ON COLUMN public.attributeuse.id IS 'id';
COMMENT ON COLUMN public.attributeuse.attributeset_id IS 'attributeset_id';
COMMENT ON COLUMN public.attributeuse.attribute_id IS 'attribute_id';
COMMENT ON COLUMN public.attributeuse.lineno IS 'lineno';
COMMENT ON TABLE public.attributevalue IS 'attributevalue';
COMMENT ON COLUMN public.attributevalue.id IS 'id';
COMMENT ON COLUMN public.attributevalue.attribute_id IS 'attribute_id';
COMMENT ON COLUMN public.attributevalue.value IS 'value';
COMMENT ON TABLE public.categories IS 'categories';
COMMENT ON COLUMN public.categories.id IS 'id';
COMMENT ON COLUMN public.categories.Name IS 'Name';
COMMENT ON COLUMN public.categories.parentid IS 'parentid';
COMMENT ON COLUMN public.categories.Image IS 'Image';
COMMENT ON TABLE public.closedcash IS 'closedcash';
COMMENT ON COLUMN public.closedcash.money IS 'money';
COMMENT ON COLUMN public.closedcash.host IS 'host';
COMMENT ON COLUMN public.closedcash.hostsequence IS 'hostsequence';
COMMENT ON COLUMN public.closedcash.datestart IS 'datestart';
COMMENT ON COLUMN public.closedcash.dateend IS 'dateend';
COMMENT ON TABLE public.Customers IS 'Customers';
COMMENT ON COLUMN public.Customers.Customers_ID IS 'Customers_ID';
COMMENT ON COLUMN public.Customers.SearchKey IS 'SearchKey';
COMMENT ON COLUMN public.Customers.TaxID IS 'TaxID';
COMMENT ON COLUMN public.Customers.Name IS 'Name';
COMMENT ON COLUMN public.Customers.TaxCategory IS 'TaxCategory';
COMMENT ON COLUMN public.Customers.Card IS 'Card';
COMMENT ON COLUMN public.Customers.MaxDebt IS 'MaxDebt';
COMMENT ON COLUMN public.Customers.Address IS 'Address';
COMMENT ON COLUMN public.Customers.Address2 IS 'Address2';
COMMENT ON COLUMN public.Customers.Postal IS 'Postal';
COMMENT ON COLUMN public.Customers.FirstName IS 'FirstName';
COMMENT ON COLUMN public.Customers.LastName IS 'LastName';
COMMENT ON COLUMN public.Customers.Email IS 'Email';
COMMENT ON COLUMN public.Customers.Phone IS 'Phone';
COMMENT ON COLUMN public.Customers.Phone2 IS 'Phone2';
COMMENT ON COLUMN public.Customers.Fax IS 'Fax';
COMMENT ON COLUMN public.Customers.Notes IS 'Notes';
COMMENT ON COLUMN public.Customers.IsVisible IS 'IsVisible';
COMMENT ON COLUMN public.Customers.CurDate IS 'CurDate';
COMMENT ON COLUMN public.Customers.CurDebt IS 'CurDebt';
COMMENT ON COLUMN public.Customers.Country_ID IS 'Country_ID';
COMMENT ON COLUMN public.Customers.City_ID IS 'City_ID';
COMMENT ON COLUMN public.Customers.Region_ID IS 'Region_ID';
COMMENT ON COLUMN public.Customers.Processing IS 'Processing';
COMMENT ON TABLE public.locations IS 'locations';
COMMENT ON COLUMN public.locations.id IS 'id';
COMMENT ON COLUMN public.locations.Name IS 'Name';
COMMENT ON COLUMN public.locations.Address IS 'Address';
COMMENT ON TABLE public.payments IS 'payments';
COMMENT ON COLUMN public.payments.id IS 'id';
COMMENT ON COLUMN public.payments.receipt IS 'receipt';
COMMENT ON COLUMN public.payments.payment IS 'payment';
COMMENT ON COLUMN public.payments.total IS 'total';
COMMENT ON COLUMN public.payments.transid IS 'transid';
COMMENT ON COLUMN public.payments.returnmsg IS 'returnmsg';
COMMENT ON TABLE public.people IS 'people';
COMMENT ON COLUMN public.people.id IS 'id';
COMMENT ON COLUMN public.people.Name IS 'Name';
COMMENT ON COLUMN public.people.apppassword IS 'apppassword';
COMMENT ON COLUMN public.people.Card IS 'Card';
COMMENT ON COLUMN public.people.role IS 'role';
COMMENT ON COLUMN public.people.IsVisible IS 'IsVisible';
COMMENT ON COLUMN public.people.Image IS 'Image';
COMMENT ON TABLE public.Applications IS 'Applications';
COMMENT ON COLUMN public.Applications.Applications_ID IS 'Applications_ID';
COMMENT ON COLUMN public.Applications.Name IS 'Name';
COMMENT ON COLUMN public.Applications.Version IS 'Version';
COMMENT ON TABLE public.FLOORS IS 'FLOORS';
COMMENT ON COLUMN public.FLOORS.FLOORS_ID IS 'FLOORS_ID';
COMMENT ON COLUMN public.FLOORS.Name IS 'Name';
COMMENT ON COLUMN public.FLOORS.Image IS 'Image';
COMMENT ON TABLE public.PLACES IS 'PLACES';
COMMENT ON COLUMN public.PLACES.PLACES_ID IS 'PLACES_ID';
COMMENT ON COLUMN public.PLACES.FLOORS_ID IS 'FLOORS_ID';
COMMENT ON COLUMN public.PLACES.Name IS 'Name';
COMMENT ON COLUMN public.PLACES.X IS 'X';
COMMENT ON COLUMN public.PLACES.Y IS 'Y';
COMMENT ON TABLE public.Resources IS 'Resources';
COMMENT ON COLUMN public.Resources.Resources_ID IS 'Resources_ID';
COMMENT ON COLUMN public.Resources.Name IS 'Name';
COMMENT ON COLUMN public.Resources.ResourcesType IS 'ResourcesType';
COMMENT ON COLUMN public.Resources.ResourceContent IS 'ResourceContent';
COMMENT ON TABLE public.products IS 'products';
COMMENT ON COLUMN public.products.id IS 'id';
COMMENT ON COLUMN public.products.reference IS 'reference';
COMMENT ON COLUMN public.products.code IS 'code';
COMMENT ON COLUMN public.products.codetype IS 'codetype';
COMMENT ON COLUMN public.products.Name IS 'Name';
COMMENT ON COLUMN public.products.pricebuy IS 'pricebuy';
COMMENT ON COLUMN public.products.pricesell IS 'pricesell';
COMMENT ON COLUMN public.products.category IS 'category';
COMMENT ON COLUMN public.products.taxcat IS 'taxcat';
COMMENT ON COLUMN public.products.attributeset_id IS 'attributeset_id';
COMMENT ON COLUMN public.products.stockcost IS 'stockcost';
COMMENT ON COLUMN public.products.stockvolume IS 'stockvolume';
COMMENT ON COLUMN public.products.Image IS 'Image';
COMMENT ON COLUMN public.products.iscom IS 'iscom';
COMMENT ON COLUMN public.products.isscale IS 'isscale';
COMMENT ON COLUMN public.products.attributes IS 'attributes';
COMMENT ON TABLE public.products_cat IS 'products_cat';
COMMENT ON COLUMN public.products_cat.product IS 'product';
COMMENT ON COLUMN public.products_cat.catorder IS 'catorder';
COMMENT ON TABLE public.products_com IS 'products_com';
COMMENT ON COLUMN public.products_com.id IS 'id';
COMMENT ON COLUMN public.products_com.product IS 'product';
COMMENT ON COLUMN public.products_com.product2 IS 'product2';
COMMENT ON TABLE public.receipts IS 'receipts';
COMMENT ON COLUMN public.receipts.id IS 'id';
COMMENT ON COLUMN public.receipts.money IS 'money';
COMMENT ON COLUMN public.receipts.datenew IS 'datenew';
COMMENT ON COLUMN public.receipts.attributes IS 'attributes';
COMMENT ON TABLE public.reservations IS 'reservations';
COMMENT ON COLUMN public.reservations.id IS 'id';
COMMENT ON COLUMN public.reservations.created IS 'created';
COMMENT ON COLUMN public.reservations.datenew IS 'datenew';
COMMENT ON COLUMN public.reservations.title IS 'title';
COMMENT ON COLUMN public.reservations.chairs IS 'chairs';
COMMENT ON COLUMN public.reservations.isdone IS 'isdone';
COMMENT ON COLUMN public.reservations.description IS 'description';
COMMENT ON TABLE public.reservation_customers IS 'reservation_customers';
COMMENT ON COLUMN public.reservation_customers.id IS 'id';
COMMENT ON COLUMN public.reservation_customers.Customers_ID IS 'Customers_ID';
COMMENT ON TABLE public.roles IS 'roles';
COMMENT ON COLUMN public.roles.id IS 'id';
COMMENT ON COLUMN public.roles.Name IS 'Name';
COMMENT ON COLUMN public.roles.permissions IS 'permissions';
COMMENT ON TABLE public.sharedtickets IS 'sharedtickets';
COMMENT ON COLUMN public.sharedtickets.id IS 'id';
COMMENT ON COLUMN public.sharedtickets.Name IS 'Name';
COMMENT ON COLUMN public.sharedtickets.ResourceContent IS 'ResourceContent';
COMMENT ON TABLE public.stockcurrent IS 'stockcurrent';
COMMENT ON COLUMN public.stockcurrent.location IS 'location';
COMMENT ON COLUMN public.stockcurrent.product IS 'product';
COMMENT ON COLUMN public.stockcurrent.attributesetinstance_id IS 'attributesetinstance_id';
COMMENT ON COLUMN public.stockcurrent.units IS 'units';
COMMENT ON TABLE public.stockdiary IS 'stockdiary';
COMMENT ON COLUMN public.stockdiary.id IS 'id';
COMMENT ON COLUMN public.stockdiary.datenew IS 'datenew';
COMMENT ON COLUMN public.stockdiary.reason IS 'reason';
COMMENT ON COLUMN public.stockdiary.location IS 'location';
COMMENT ON COLUMN public.stockdiary.product IS 'product';
COMMENT ON COLUMN public.stockdiary.attributesetinstance_id IS 'attributesetinstance_id';
COMMENT ON COLUMN public.stockdiary.units IS 'units';
COMMENT ON COLUMN public.stockdiary.price IS 'price';
COMMENT ON TABLE public.stocklevel IS 'stocklevel';
COMMENT ON COLUMN public.stocklevel.id IS 'id';
COMMENT ON COLUMN public.stocklevel.location IS 'location';
COMMENT ON COLUMN public.stocklevel.product IS 'product';
COMMENT ON COLUMN public.stocklevel.stocksecurity IS 'stocksecurity';
COMMENT ON COLUMN public.stocklevel.stockmaximum IS 'stockmaximum';
COMMENT ON TABLE public.taxcategories IS 'taxcategories';
COMMENT ON COLUMN public.taxcategories.id IS 'id';
COMMENT ON COLUMN public.taxcategories.Name IS 'Name';
COMMENT ON TABLE public.taxcustcategories IS 'taxcustcategories';
COMMENT ON COLUMN public.taxcustcategories.id IS 'id';
COMMENT ON COLUMN public.taxcustcategories.Name IS 'Name';
COMMENT ON TABLE public.taxes IS 'taxes';
COMMENT ON COLUMN public.taxes.id IS 'id';
COMMENT ON COLUMN public.taxes.Name IS 'Name';
COMMENT ON COLUMN public.taxes.validfrom IS 'validfrom';
COMMENT ON COLUMN public.taxes.category IS 'category';
COMMENT ON COLUMN public.taxes.custcategory IS 'custcategory';
COMMENT ON COLUMN public.taxes.parentid IS 'parentid';
COMMENT ON COLUMN public.taxes.rate IS 'rate';
COMMENT ON COLUMN public.taxes.ratecascade IS 'ratecascade';
COMMENT ON COLUMN public.taxes.rateorder IS 'rateorder';
COMMENT ON TABLE public.taxlines IS 'taxlines';
COMMENT ON COLUMN public.taxlines.id IS 'id';
COMMENT ON COLUMN public.taxlines.receipt IS 'receipt';
COMMENT ON COLUMN public.taxlines.taxid IS 'taxid';
COMMENT ON COLUMN public.taxlines.base IS 'base';
COMMENT ON COLUMN public.taxlines.amount IS 'amount';
COMMENT ON TABLE public.thirdparties IS 'thirdparties';
COMMENT ON COLUMN public.thirdparties.id IS 'id';
COMMENT ON COLUMN public.thirdparties.cif IS 'cif';
COMMENT ON COLUMN public.thirdparties.Name IS 'Name';
COMMENT ON COLUMN public.thirdparties.Address IS 'Address';
COMMENT ON COLUMN public.thirdparties.contactcomm IS 'contactcomm';
COMMENT ON COLUMN public.thirdparties.contactfact IS 'contactfact';
COMMENT ON COLUMN public.thirdparties.payrule IS 'payrule';
COMMENT ON COLUMN public.thirdparties.faxnumber IS 'faxnumber';
COMMENT ON COLUMN public.thirdparties.phonenumber IS 'phonenumber';
COMMENT ON COLUMN public.thirdparties.mobilenumber IS 'mobilenumber';
COMMENT ON COLUMN public.thirdparties.Email IS 'Email';
COMMENT ON COLUMN public.thirdparties.webpage IS 'webpage';
COMMENT ON COLUMN public.thirdparties.Notes IS 'Notes';
COMMENT ON TABLE public.ticketlines IS 'ticketlines';
COMMENT ON COLUMN public.ticketlines.ticket IS 'ticket';
COMMENT ON COLUMN public.ticketlines.line IS 'line';
COMMENT ON COLUMN public.ticketlines.product IS 'product';
COMMENT ON COLUMN public.ticketlines.attributesetinstance_id IS 'attributesetinstance_id';
COMMENT ON COLUMN public.ticketlines.units IS 'units';
COMMENT ON COLUMN public.ticketlines.price IS 'price';
COMMENT ON COLUMN public.ticketlines.taxid IS 'taxid';
COMMENT ON COLUMN public.ticketlines.attributes IS 'attributes';
COMMENT ON TABLE public.tickets IS 'tickets';
COMMENT ON COLUMN public.tickets.id IS 'id';
COMMENT ON COLUMN public.tickets.tickettype IS 'tickettype';
COMMENT ON COLUMN public.tickets.ticketid IS 'ticketid';
COMMENT ON COLUMN public.tickets.person IS 'person';
COMMENT ON COLUMN public.tickets.status IS 'status';
COMMENT ON COLUMN public.tickets.Customers_ID IS 'Customers_ID';



INSERT INTO Applications (Applications_ID, NAME, VERSION) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});

INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('0', 'Rol Administrador', $FILE{/com/openbravo/pos/templates/Role.Administrator.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('1', 'Rol Encargado', $FILE{/com/openbravo/pos/templates/Role.Manager.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('2', 'Rol Empleado', $FILE{/com/openbravo/pos/templates/Role.Employee.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('3', 'Rol Invitado', $FILE{/com/openbravo/pos/templates/Role.Guest.xml} );


INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('0', 'Administrador', NULL, '0', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('1', 'Encargado', NULL, '1', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('2', 'Empleado', NULL, '2', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('3', 'Invitado', NULL, '3', TRUE, NULL);

INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('0', 'Printer.Start', 0, $FILE{/com/openbravo/pos/templates/Printer.Start.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('1', 'Printer.Ticket', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('2', 'Printer.Ticket2', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket2.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('3', 'Printer.TicketPreview', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketPreview.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('4', 'Printer.TicketTotal', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketTotal.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('5', 'Printer.OpenDrawer', 0, $FILE{/com/openbravo/pos/templates/Printer.OpenDrawer.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('6', 'Printer.Ticket.Logo', 1, $FILE{/com/openbravo/pos/templates/Printer.Ticket.Logo.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('7', 'Printer.TicketLine', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketLine.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('8', 'Printer.CloseCash', 0, $FILE{/com/openbravo/pos/templates/Printer.CloseCash.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('9', 'Window.Logo', 1, $FILE{/com/openbravo/pos/templates/Window.Logo.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('10', 'Window.Title', 0, $FILE{/com/openbravo/pos/templates/Window.Title.txt});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('11', 'Ticket.Buttons', 0, $FILE{/com/openbravo/pos/templates/Ticket.Buttons.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('12', 'Ticket.Line', 0, $FILE{/com/openbravo/pos/templates/Ticket.Line.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('13', 'Printer.Inventory', 0, $FILE{/com/openbravo/pos/templates/Printer.Inventory.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('14', 'Menu.Root', 0, $FILE{/com/openbravo/pos/templates/Menu.Root.txt});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('15', 'Printer.CustomerPaid', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('16', 'Printer.CustomerPaid2', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid2.xml});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('17', 'payment.cash_lve', 0, $FILE{/com/openbravo/pos/templates/payment.cash_lve.txt});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('18', 'money.100BsF', 1, $FILE{/com/openbravo/pos/templates/money.100BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('19', 'money.10BsF', 1, $FILE{/com/openbravo/pos/templates/money.10BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('20', 'money.20BsF', 1, $FILE{/com/openbravo/pos/templates/money.20BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('21', 'money.2BsF', 1, $FILE{/com/openbravo/pos/templates/money.2BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('22', 'money.50BsF', 1, $FILE{/com/openbravo/pos/templates/money.50BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('23', 'money.5BsF', 1, $FILE{/com/openbravo/pos/templates/money.5BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('24', 'coin.0,01BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,01BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('25', 'coin.0,05BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,05BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('26', 'coin.0,10BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,10BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('27', 'coin.0,125BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,125BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('28', 'coin.0,25BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,25BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('29', 'coin.0,5BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,5BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('30', 'coin.1BsF', 1, $FILE{/com/openbravo/pos/templates/coin.1BsF.png});
INSERT INTO Resources(Resources_ID, Name, ResourcesType, ResourceContent) VALUES('32', 'Printer.PartialCash', 0, $FILE{/com/openbravo/pos/templates/Printer.PartialCash.xml});

INSERT INTO CATEGORIES(ID, NAME) VALUES ('000', 'Estandar');

INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('000', 'EXCENTO');
INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('001', 'IVA');

INSERT INTO TAXCUSTCATEGORIES(ID, NAME) VALUES ( '000', 'Clientes No Frecuentes');
INSERT INTO TAXCUSTCATEGORIES(ID, NAME) VALUES ( '001', 'Clientes Frecuentes');


INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('000', 'EXCENTO', '000', NULL, NULL, 0, FALSE, NULL);
INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('001', 'IVA 8%', '001', '000', NULL, 0.08, FALSE, NULL);
INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('002', 'IVA 12%', '001', '001', NULL, 0.12, FALSE, NULL);

INSERT INTO LOCATIONS(ID, NAME,ADDRESS) VALUES('0', 'General', NULL);

INSERT INTO FLOORS(FLOORS_ID, NAME, IMAGE) VALUES ('0', 'Restaurant floor', $FILE{/com/openbravo/pos/templates/restaurantsample.png});

INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('1', 'Table 1', 133, 151, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('2', 'Table 2', 532, 151, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('3', 'Table 3', 133, 264, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('4', 'Table 4', 266, 264, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('5', 'Table 5', 399, 264, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('6', 'Table 6', 532, 264, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('7', 'Table 7', 133, 377, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('8', 'Table 8', 266, 377, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('9', 'Table 9', 399, 377, '0');
INSERT INTO PLACES(PLACES_ID, NAME, X, Y, FLOORS_ID) VALUES ('10', 'Table 10', 532, 377, '0');

INSERT INTO public.products(id, reference, code, codetype, name, pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume, image, iscom, isscale, attributes)
  VALUES('5b6c854e-05cc-4f3b-867e-6232a72cef45', '1234', '1234', NULL, 'Prueba Con IVA', 100, 150, '000', '001', NULL, NULL, NULL, NULL, false, false, NULL);
INSERT INTO public.products(id, reference, code, codetype, name, pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume, image, iscom, isscale, attributes)
  VALUES('51761c31-a72f-4624-80ba-b6a2af36c6c7', '1235', '1235', NULL, 'Prueba Excento', 120, 250, '000', '000', NULL, NULL, NULL, NULL, false, false, NULL);


INSERT INTO public.products_cat(product, catorder)
  VALUES('5b6c854e-05cc-4f3b-867e-6232a72cef45', NULL);
INSERT INTO public.products_cat(product, catorder)
  VALUES('51761c31-a72f-4624-80ba-b6a2af36c6c7', NULL);

INSERT INTO public.stocklevel(id, location, product, stocksecurity, stockmaximum)
  VALUES('5cea3ef5-e4f2-4d60-8276-7f538839c2a6', '0', '5b6c854e-05cc-4f3b-867e-6232a72cef45', 10, 30);
INSERT INTO public.stocklevel(id, location, product, stocksecurity, stockmaximum)
  VALUES('0e88d1ec-21a5-48f2-9371-8a9e378553e5', '0', '51761c31-a72f-4624-80ba-b6a2af36c6c7', 20, 50);

INSERT INTO public.stockdiary(id, datenew, reason, location, product, attributesetinstance_id, units, price)
  VALUES('5a8b27d4-4656-4c3c-a792-9d81eca77d8d', '2016-08-24 10:12:00.0', 1, '0', '5b6c854e-05cc-4f3b-867e-6232a72cef45', NULL, 30, 100);
INSERT INTO public.stockdiary(id, datenew, reason, location, product, attributesetinstance_id, units, price)
  VALUES('03730080-a2a8-4aae-9ab4-7bebf9c2634a', '2016-08-24 10:12:00.0', 1, '0', '51761c31-a72f-4624-80ba-b6a2af36c6c7', NULL, 50, 120);

INSERT INTO public.stockcurrent(location, product, attributesetinstance_id, units)
  VALUES('0', '5b6c854e-05cc-4f3b-867e-6232a72cef45', NULL, 30);
INSERT INTO public.stockcurrent(location, product, attributesetinstance_id, units)
  VALUES('0', '51761c31-a72f-4624-80ba-b6a2af36c6c7', NULL, 50);

