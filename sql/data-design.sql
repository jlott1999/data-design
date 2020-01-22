mysql> ALTER DATABASE @jlott3 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS profileId;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS item;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId BINARY(16) NOT NULL,
	profileEmail VARCHAR(128) NOT NULL,
	profileCreateDate DATETIME(128) NOT NULL,
	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

CREATE TABLE payment (
	-- this is for yet another primary key...
	paymentId BINARY(16) NOT NULL,
	-- this is for a foreign key
	paymentProfileId BINARY(16) NOT NULL,
	paymentItemId BINARY(16) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(paymentId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(paymentProfileId) REFERENCES profile(profileId),
	-- and finally create the primary key
	PRIMARY KEY(paymentId)
);

CREATE TABLE item (
	-- these are still foreign keys
	itemId BINARY(16) NOT NULL,
	itemProfileId BINARY(16) NOT NULL,
	itemCreateDate DATETIME(6) NOT NULL,
	-- index the foreign keys
	INDEX(itemId),
	INDEX(itemProfileId),
	-- create the foreign key relations
	FOREIGN KEY(itemProfileId) REFERENCES profile(profileId),
	FOREIGN KEY(itemCreateDate) REFERENCES payment(paymentProfileId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(itemId)
);