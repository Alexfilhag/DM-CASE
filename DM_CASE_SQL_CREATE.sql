CREATE TABLE Person
(
	person_id CHAR(5) 	NOT NULL ,
	first_name VARCHAR(50) 	NOT NULL,
	last_name VARCHAR(50) 	NOT NULL,
	email VARCHAR(50) 	NOT NULL,
	phone VARCHAR(50) NOT NULL,
	ageGroup VARCHAR(5),
	consentToStoreData CHAR(1) 	NOT NULL,	role VARCHAR(20) NOT NULL,
	enrollment_date DATETIME NOT NULL,

	CONSTRAINT PK_Person PRIMARY KEY (person_id),
	CONSTRAINT AK_Person UNIQUE (email),
	CONSTRAINT CHK_Person_email CHECK (PATINDEX('%_@__%.__%', email) <> 0),
	CONSTRAINT CHK_Person_consentToStoreData CHECK (consentToStoreData = 'Y' OR consentToStoreData = 'N')
)

CREATE TABLE Tour 
(
	tour_id CHAR(4)	NOT NULL ,
	name VARCHAR(50) 	NOT NULL,
	description VARCHAR(150) NOT NULL,
	date DATETIME 		NOT NULL,
	isCancelled CHAR(1) NOT NULL,

	CONSTRAINT CHK_Tour_cancelled CHECK(isCancelled = 'Y' OR isCancelled = 'N'),
	CONSTRAINT PK_Tour PRIMARY KEY (tour_id),
	CONSTRAINT AK_Tour UNIQUE (name)
)

CREATE TABLE TourPerson
(
	tour_id CHAR(4) 	NOT NULL,
	person_id CHAR(5) 	NOT NULL,
	partIsCancelled CHAR(1) NOT NULL,

	CONSTRAINT PK_TourPerson PRIMARY KEY (tour_id, person_id),
	CONSTRAINT FK_TourPerson_Person FOREIGN KEY (person_id) REFERENCES Person (person_id),
	CONSTRAINT FK_TourPerson_Tour FOREIGN KEY (tour_id) REFERENCES Tour (tour_id),	CONSTRAINT CHK_TourPerson_partIsCancelled CHECK(partIsCancelled = 'Y' OR partIsCancelled = 'N'),
	
)

CREATE TABLE Site
(
	site_id CHAR(4)  NOT NULL,
	name VARCHAR(50) NOT NULL,	
	CONSTRAINT PK_Site PRIMARY KEY (site_id),
	CONSTRAINT AK_Site UNIQUE (name)
)  

CREATE TABLE Tag
(
	tag_id CHAR(4)  NOT NULL,
	description VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Tag PRIMARY KEY (tag_id),
	CONSTRAINT AK_Tag UNIQUE (description)
)

CREATE TABLE SiteTag
(
	site_id CHAR(4) NOT NULL,
	tag_id CHAR(4) 	NOT NULL,
	CONSTRAINT PK_SiteTag PRIMARY KEY (site_id, tag_id),
	CONSTRAINT FK_SiteTag_Site FOREIGN KEY (site_id) REFERENCES Site (site_id),
	CONSTRAINT FK_SiteTag_Tag FOREIGN KEY (tag_id) REFERENCES Tag (tag_id)
)

CREATE TABLE TourSite
(
	tour_id CHAR(4) NOT NULL,
	site_id CHAR(4) NOT NULL,
	CONSTRAINT PK_TourSite PRIMARY KEY (tour_id, site_id),
	CONSTRAINT FK_TourSite_Tour FOREIGN KEY (tour_id) REFERENCES Tour (tour_id),
	CONSTRAINT FK_TourSite_Site FOREIGN KEY (site_id) REFERENCES Site (site_id)
)

CREATE TABLE SiteEvaluation
(	 
	site_id CHAR(4) 	NOT NULL,
	person_id CHAR(5) 	NOT NULL,	description VARCHAR(50) NOT NULL
	
	CONSTRAINT PK_SiteEvaluation PRIMARY KEY (site_id, person_id ),
	CONSTRAINT FK_SiteEvaluation_Site FOREIGN KEY (site_id) REFERENCES Site (site_id),
	CONSTRAINT FK_SiteEvaluation_Person FOREIGN KEY (person_id) REFERENCES Person (person_id)
)
