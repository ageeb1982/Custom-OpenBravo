
/* Drop Indexes */

DROP INDEX IF EXISTS attuse_line;
DROP INDEX IF EXISTS closedcash_inx_seq;
DROP INDEX IF EXISTS closedcash_inx_1;
DROP INDEX IF EXISTS payments_inx_1;
DROP INDEX IF EXISTS people_card_inx;
DROP INDEX IF EXISTS customers_card_inx;
DROP INDEX IF EXISTS customers_name_inx;
DROP INDEX IF EXISTS customers_taxid_inx;
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
DROP TABLE IF EXISTS public.POS_Customers;
DROP TABLE IF EXISTS POS_City;
DROP TABLE IF EXISTS POS_Region;
DROP TABLE IF EXISTS POS_Country;
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
DROP TABLE IF EXISTS public.POS_Applications;
DROP TABLE IF EXISTS public.POS_Places;
DROP TABLE IF EXISTS public.POS_Floors;
DROP TABLE IF EXISTS public.POS_Resources;
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

CREATE TABLE POS_City
(
	POS_City varchar NOT NULL,
	POS_Country_ID varchar NOT NULL,
	POS_Region_ID varchar NOT NULL,
	IsActive char(1),
	Name varchar,
	LoCode varchar(10),
	AreaCode varchar(10),
	PRIMARY KEY (POS_City)
) WITHOUT OIDS;


CREATE TABLE POS_Country
(
	POS_Country_ID varchar NOT NULL,
	IsActive char(1),
	Name varchar NOT NULL,
	Description varchar(255),
	CountryCode char(2),
	IsHasRegion char(1),
	RegionName varchar,
	PRIMARY KEY (POS_Country_ID)
) WITHOUT OIDS;


CREATE TABLE POS_Region
(
	POS_Region_ID varchar NOT NULL,
	POS_Country_ID varchar NOT NULL,
	IsActive char(1),
	Name varchar,
	Description varchar(255),
	IsDefault char(1),
	PRIMARY KEY (POS_Region_ID)
) WITHOUT OIDS;


CREATE TABLE public.attribute
(
	id varchar NOT NULL,
	Name varchar NOT NULL,
	CONSTRAINT attribute_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.attributeinstance
(
	id varchar NOT NULL,
	attributesetinstance_id varchar NOT NULL,
	attribute_id varchar NOT NULL,
	value varchar,
	CONSTRAINT attributeinstance_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.attributeset
(
	id varchar NOT NULL,
	Name varchar NOT NULL,
	CONSTRAINT attributeset_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.attributesetinstance
(
	id varchar NOT NULL,
	attributeset_id varchar NOT NULL,
	description varchar,
	CONSTRAINT attributesetinstance_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.attributeuse
(
	id varchar NOT NULL,
	attributeset_id varchar NOT NULL,
	attribute_id varchar NOT NULL,
	lineno int,
	CONSTRAINT attributeuse_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.attributevalue
(
	id varchar NOT NULL,
	attribute_id varchar NOT NULL,
	value varchar,
	CONSTRAINT attributevalue_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.categories
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	parentid varchar,
	Image bytea,
	CONSTRAINT categories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.closedcash
(
	money varchar NOT NULL,
	host varchar NOT NULL,
	hostsequence int NOT NULL,
	datestart timestamp NOT NULL,
	dateend timestamp,
	CONSTRAINT closedcash_pkey PRIMARY KEY (money)
) WITHOUT OIDS;


CREATE TABLE public.locations
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	Address varchar,
	CONSTRAINT locations_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.payments
(
	id varchar NOT NULL,
	receipt varchar NOT NULL,
	payment varchar NOT NULL,
	total float NOT NULL,
	transid varchar,
	returnmsg bytea,
	CONSTRAINT payments_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.people
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	apppassword varchar,
	Card varchar,
	role varchar NOT NULL,
	IsVisible boolean NOT NULL,
	Image bytea,
	CONSTRAINT people_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.POS_Applications
(
	POS_Applications_ID varchar NOT NULL,
	Name varchar NOT NULL,
	Version varchar NOT NULL,
	CONSTRAINT applications_pkey PRIMARY KEY (POS_Applications_ID)
) WITHOUT OIDS;


CREATE TABLE public.POS_Customers
(
	POS_Customers_ID varchar NOT NULL,
	SearchKey varchar NOT NULL UNIQUE,
	TaxID varchar(20),
	Name varchar NOT NULL,
	TaxCategory varchar,
	Card varchar,
	MaxDebt float DEFAULT 0 NOT NULL,
	Address varchar,
	Address2 varchar,
	Postal varchar,
	FirstName varchar(60),
	LastName varchar(60),
	Email varchar,
	Phone varchar,
	Phone2 varchar,
	Fax varchar,
	Notes varchar,
	IsVisible boolean DEFAULT 'true' NOT NULL,
	CurDate timestamp,
	CurDebt float,
	POS_Country_ID varchar NOT NULL,
	POS_City varchar NOT NULL,
	POS_Region_ID varchar NOT NULL,
	Processing char(1),
	CONSTRAINT customers_pkey PRIMARY KEY (POS_Customers_ID)
) WITHOUT OIDS;


CREATE TABLE public.POS_Floors
(
	POS_Floors_ID varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	Image bytea,
	CONSTRAINT floors_pkey PRIMARY KEY (POS_Floors_ID)
) WITHOUT OIDS;


CREATE TABLE public.POS_Places
(
	POS_Places_ID varchar NOT NULL,
	POS_Floors_ID varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	X int NOT NULL,
	Y int NOT NULL,
	CONSTRAINT places_pkey PRIMARY KEY (POS_Places_ID)
) WITHOUT OIDS;


CREATE TABLE public.POS_Resources
(
	POS_Resources_ID varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	ResourcesType int NOT NULL,
	ResourceContent bytea,
	CONSTRAINT resources_pkey PRIMARY KEY (POS_Resources_ID)
) WITHOUT OIDS;


CREATE TABLE public.products
(
	id varchar NOT NULL,
	reference varchar NOT NULL UNIQUE,
	code varchar NOT NULL UNIQUE,
	codetype varchar,
	Name varchar NOT NULL UNIQUE,
	pricebuy float NOT NULL,
	pricesell float NOT NULL,
	category varchar NOT NULL,
	taxcat varchar NOT NULL,
	attributeset_id varchar,
	stockcost float,
	stockvolume float,
	Image bytea,
	iscom boolean DEFAULT 'false' NOT NULL,
	isscale boolean DEFAULT 'false' NOT NULL,
	attributes bytea,
	CONSTRAINT products_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.products_cat
(
	product varchar NOT NULL,
	catorder int,
	CONSTRAINT products_cat_pkey PRIMARY KEY (product)
) WITHOUT OIDS;


CREATE TABLE public.products_com
(
	id varchar NOT NULL,
	product varchar NOT NULL,
	product2 varchar NOT NULL,
	CONSTRAINT products_com_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.receipts
(
	id varchar NOT NULL,
	money varchar NOT NULL,
	datenew timestamp NOT NULL,
	attributes bytea,
	CONSTRAINT receipts_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.reservations
(
	id varchar NOT NULL,
	created timestamp NOT NULL,
	datenew timestamp DEFAULT '2001-01-01 00:00:00'::timestamp without time zone NOT NULL,
	title varchar NOT NULL,
	chairs int NOT NULL,
	isdone boolean NOT NULL,
	description varchar,
	CONSTRAINT reservations_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.reservation_customers
(
	id varchar NOT NULL,
	POS_Customers_ID varchar NOT NULL,
	CONSTRAINT reservation_customers_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.roles
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	permissions bytea,
	CONSTRAINT roles_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.sharedtickets
(
	id varchar NOT NULL,
	Name varchar NOT NULL,
	ResourceContent bytea,
	CONSTRAINT sharedtickets_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.stockcurrent
(
	location varchar NOT NULL,
	product varchar NOT NULL,
	attributesetinstance_id varchar,
	units float NOT NULL
) WITHOUT OIDS;


CREATE TABLE public.stockdiary
(
	id varchar NOT NULL,
	datenew timestamp NOT NULL,
	reason int NOT NULL,
	location varchar NOT NULL,
	product varchar NOT NULL,
	attributesetinstance_id varchar,
	units float NOT NULL,
	price float NOT NULL,
	CONSTRAINT stockdiary_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.stocklevel
(
	id varchar NOT NULL,
	location varchar NOT NULL,
	product varchar NOT NULL,
	stocksecurity float,
	stockmaximum float,
	CONSTRAINT stocklevel_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.taxcategories
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	CONSTRAINT taxcategories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.taxcustcategories
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	CONSTRAINT taxcustcategories_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.taxes
(
	id varchar NOT NULL,
	Name varchar NOT NULL UNIQUE,
	validfrom timestamp DEFAULT '2001-01-01 00:00:00'::timestamp without time zone NOT NULL,
	category varchar NOT NULL,
	custcategory varchar,
	parentid varchar,
	rate float NOT NULL,
	ratecascade boolean DEFAULT 'false' NOT NULL,
	rateorder int,
	CONSTRAINT taxes_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.taxlines
(
	id varchar NOT NULL,
	receipt varchar NOT NULL,
	taxid varchar NOT NULL,
	base float NOT NULL,
	amount float NOT NULL,
	CONSTRAINT taxlines_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.thirdparties
(
	id varchar NOT NULL,
	cif varchar NOT NULL UNIQUE,
	Name varchar NOT NULL UNIQUE,
	Address varchar,
	contactcomm varchar,
	contactfact varchar,
	payrule varchar,
	faxnumber varchar,
	phonenumber varchar,
	mobilenumber varchar,
	Email varchar,
	webpage varchar,
	Notes varchar,
	CONSTRAINT thirdparties_pkey PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE public.ticketlines
(
	ticket varchar NOT NULL,
	line int NOT NULL,
	product varchar,
	attributesetinstance_id varchar,
	units float NOT NULL,
	price float NOT NULL,
	taxid varchar NOT NULL,
	attributes bytea,
	CONSTRAINT ticketlines_pkey PRIMARY KEY (ticket, line)
) WITHOUT OIDS;


CREATE TABLE public.tickets
(
	id varchar NOT NULL,
	tickettype int DEFAULT 0 NOT NULL,
	ticketid int NOT NULL,
	person varchar NOT NULL,
	status int DEFAULT 0 NOT NULL,
	POS_Customers_ID varchar NOT NULL,
	CONSTRAINT tickets_pkey PRIMARY KEY (id)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE public.POS_Customers 
	ADD FOREIGN KEY (POS_City)
	REFERENCES POS_City (POS_City)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POS_City 
	ADD FOREIGN KEY (POS_Country_ID)
	REFERENCES POS_Country (POS_Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POS_Region 
	ADD FOREIGN KEY (POS_Country_ID)
	REFERENCES POS_Country (POS_Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.POS_Customers 
	ADD FOREIGN KEY (POS_Country_ID)
	REFERENCES POS_Country (POS_Country_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POS_City 
	ADD FOREIGN KEY (POS_Region_ID)
	REFERENCES POS_Region (POS_Region_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.POS_Customers 
	ADD FOREIGN KEY (POS_Region_ID)
	REFERENCES POS_Region (POS_Region_ID)
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


ALTER TABLE public.reservation_customers
 	ADD CONSTRAINT res_cust_fk_2 FOREIGN KEY (POS_Customers_ID)
	REFERENCES public.POS_Customers (POS_Customers_ID)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.tickets
 	ADD CONSTRAINT tickets_customers_fk FOREIGN KEY (POS_Customers_ID)
	REFERENCES public.POS_Customers (POS_Customers_ID)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.POS_Places
 	ADD CONSTRAINT places_fk_1 FOREIGN KEY (POS_Floors_ID)
	REFERENCES public.POS_Floors (POS_Floors_ID)
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
 	ADD CONSTRAINT products_com_fk_2 FOREIGN KEY (product2)
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


ALTER TABLE public.POS_Customers
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
CREATE INDEX payments_inx_1 ON public.payments USING BTREE (payment);
CREATE INDEX people_card_inx ON public.people USING BTREE (Card);
CREATE INDEX customers_card_inx ON public.POS_Customers USING BTREE (Card);
CREATE INDEX customers_name_inx ON public.POS_Customers USING BTREE (Name);
CREATE INDEX customers_taxid_inx ON public.POS_Customers USING BTREE (TaxID);
CREATE INDEX products_cat_inx_1 ON public.products_cat USING BTREE (catorder);
CREATE UNIQUE INDEX pcom_inx_prod ON public.products_com USING BTREE (product, product2);
CREATE INDEX receipts_inx_1 ON public.receipts USING BTREE (datenew);
CREATE INDEX reservations_inx_1 ON public.reservations USING BTREE (datenew);
CREATE UNIQUE INDEX stockcurrent_inx ON public.stockcurrent USING BTREE (location, product, attributesetinstance_id);
CREATE INDEX stockdiary_inx_1 ON public.stockdiary USING BTREE (datenew);
CREATE INDEX tickets_ticketid ON public.tickets USING BTREE (tickettype, ticketid);



INSERT INTO POS_Applications (POS_Applications_ID, NAME, VERSION) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});

INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('0', 'Rol Administrador', $FILE{/com/openbravo/pos/templates/Role.Administrator.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('1', 'Rol Encargado', $FILE{/com/openbravo/pos/templates/Role.Manager.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('2', 'Rol Empleado', $FILE{/com/openbravo/pos/templates/Role.Employee.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('3', 'Rol Invitado', $FILE{/com/openbravo/pos/templates/Role.Guest.xml} );


INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('0', 'Administrador', NULL, '0', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('1', 'Encargado', NULL, '1', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('2', 'Empleado', NULL, '2', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, ISVISIBLE, IMAGE) VALUES ('3', 'Invitado', NULL, '3', TRUE, NULL);

INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('0', 'Printer.Start', 0, $FILE{/com/openbravo/pos/templates/Printer.Start.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('1', 'Printer.Ticket', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('2', 'Printer.Ticket2', 0, $FILE{/com/openbravo/pos/templates/Printer.Ticket2.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('3', 'Printer.TicketPreview', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketPreview.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('4', 'Printer.TicketTotal', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketTotal.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('5', 'Printer.OpenDrawer', 0, $FILE{/com/openbravo/pos/templates/Printer.OpenDrawer.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('6', 'Printer.Ticket.Logo', 1, $FILE{/com/openbravo/pos/templates/Printer.Ticket.Logo.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('7', 'Printer.TicketLine', 0, $FILE{/com/openbravo/pos/templates/Printer.TicketLine.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('8', 'Printer.CloseCash', 0, $FILE{/com/openbravo/pos/templates/Printer.CloseCash.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('9', 'Window.Logo', 1, $FILE{/com/openbravo/pos/templates/Window.Logo.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('10', 'Window.Title', 0, $FILE{/com/openbravo/pos/templates/Window.Title.txt});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('11', 'Ticket.Buttons', 0, $FILE{/com/openbravo/pos/templates/Ticket.Buttons.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('12', 'Ticket.Line', 0, $FILE{/com/openbravo/pos/templates/Ticket.Line.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('13', 'Printer.Inventory', 0, $FILE{/com/openbravo/pos/templates/Printer.Inventory.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('14', 'Menu.Root', 0, $FILE{/com/openbravo/pos/templates/Menu.Root.txt});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('15', 'Printer.CustomerPaid', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('16', 'Printer.CustomerPaid2', 0, $FILE{/com/openbravo/pos/templates/Printer.CustomerPaid2.xml});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('17', 'payment.cash_lve', 0, $FILE{/com/openbravo/pos/templates/payment.cash_lve.txt});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('18', 'money.100BsF', 1, $FILE{/com/openbravo/pos/templates/money.100BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('19', 'money.10BsF', 1, $FILE{/com/openbravo/pos/templates/money.10BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('20', 'money.20BsF', 1, $FILE{/com/openbravo/pos/templates/money.20BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('21', 'money.2BsF', 1, $FILE{/com/openbravo/pos/templates/money.2BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('22', 'money.50BsF', 1, $FILE{/com/openbravo/pos/templates/money.50BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('23', 'money.5BsF', 1, $FILE{/com/openbravo/pos/templates/money.5BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('24', 'coin.0,01BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,01BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('25', 'coin.0,05BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,05BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('26', 'coin.0,10BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,10BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('27', 'coin.0,125BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,125BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('28', 'coin.0,25BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,25BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('29', 'coin.0,5BsF', 1, $FILE{/com/openbravo/pos/templates/coin.0,5BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('30', 'coin.1BsF', 1, $FILE{/com/openbravo/pos/templates/coin.1BsF.png});
INSERT INTO POS_Resources(POS_Resources_ID, Name, ResourcesType, ResourceContent) VALUES('32', 'Printer.PartialCash', 0, $FILE{/com/openbravo/pos/templates/Printer.PartialCash.xml});

INSERT INTO CATEGORIES(ID, NAME) VALUES ('000', 'Estandar');

INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('000', 'Excento');
INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('001', 'Estandar');

INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('000', 'Impuesto Excento', '000', NULL, NULL, 0, FALSE, NULL);
INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('001', 'Impuesto Estandar', '001', NULL, NULL, 0.10, FALSE, NULL);

INSERT INTO LOCATIONS(ID, NAME,ADDRESS) VALUES('0', 'General', NULL);

INSERT INTO POS_FLOORS(POS_FLOORS_ID, NAME, IMAGE) VALUES ('0', 'Restaurant floor', $FILE{/com/openbravo/pos/templates/restaurantsample.png});

INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('1', 'Table 1', 133, 151, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('2', 'Table 2', 532, 151, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('3', 'Table 3', 133, 264, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('4', 'Table 4', 266, 264, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('5', 'Table 5', 399, 264, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('6', 'Table 6', 532, 264, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('7', 'Table 7', 133, 377, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('8', 'Table 8', 266, 377, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('9', 'Table 9', 399, 377, '0');
INSERT INTO POS_PLACES(POS_PLACES_ID, NAME, X, Y, POS_FLOORS_ID) VALUES ('10', 'Table 10', 532, 377, '0');
