CREATE DATABASE IF NOT EXISTS eVoznikDB;
USE eVoznikDB;          


DROP TABLE IF EXISTS driving_school; 
DROP TABLE IF EXISTS tariff; 
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS instructor; 
DROP TABLE IF EXISTS availability;  
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS reg_code;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS signin_data;
DROP TABLE IF EXISTS drives;
DROP TABLE IF EXISTS docs;
DROP TABLE IF EXISTS subject;


CREATE TABLE IF NOT EXISTS instructor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(50) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    password VARCHAR(1000) NOT NULL, 
    phone VARCHAR(25) NOT NULL,
    licence VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nmb_document VARCHAR(50) UNIQUE NOT NULL, /* from document */
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(25),
    address VARCHAR(255) NOT NULL,
    FK_location INT,
    FK_signin_data INT
);

CREATE TABLE IF NOT EXISTS location (
	id INT PRIMARY KEY AUTO_INCREMENT,
    zip VARCHAR(25) NOT NULL, 
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS signin_data (
    id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL, 
    password VARCHAR(1000) NOT NULL 
);

CREATE TABLE IF NOT EXISTS reg_code (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FK_user INT,
    exp_date DATE,
    code VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS docs (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FK_user INT,
    type VARCHAR(45),
    pdfDoc BLOB
);

CREATE TABLE IF NOT EXISTS drives (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    date_time DATETIME
);

CREATE TABLE IF NOT EXISTS subject (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    name VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS availability (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    date_time DATETIME, 
    FK_instructor INT
);

CREATE TABLE IF NOT EXISTS driving_school (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    name VARCHAR(45),
    email VARCHAR(255),
    password VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS tariff (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FK_drinving_school INT,
    service VARCHAR(45),
    service_price DOUBLE
);


ALTER TABLE user ADD CONSTRAINT FK_signin_data FOREIGN KEY (FK_signin_data) REFERENCES signin_data(id) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE reg_code ADD CONSTRAINT FK_user FOREIGN KEY (FK_user) REFERENCES user(id) ON DELETE CASCADE ON UPDATE NO ACTION;


INSERT INTO signin_data VALUES 
/* id, 		email, 								password */	
(1, 		"email.user@email.com",				"GesloGeslo123!");

INSERT INTO location VALUES 
/* id, 		zip, 		city,				country */	
(1, 		"1000",		"Ljubljana", 		"Slovenija");


INSERT INTO user VALUES 
/* id, 	nmb_document,				name,		lastname, 		phone, 			address, 			FK_location,	FK_signin_data */
(1, 	"PERSONALDOCNUMBER123",		"Ime", 		"Priimek", 		"123-456-789", "Ulica Prva 1", 		1, 				1);

INSERT INTO reg_code VALUES 
/* id, 		FK_user 			exp_date,		code */	
(1, 		1,					'2024-12-11',	"code");

INSERT INTO docs VALUES 
/* id, 	FK_user, 	type, 					pdfDoc*/	
(1, 	1, 			"CPP", 					null),
(2, 	1, 			"Prva pomoc", 			null),
(3, 	1, 			"Zdravstveno potrdilo", null);

INSERT INTO category VALUES 
/* id, 	name */	
(1, 	"A1"),
(2, 	"A2"),
(3, 	"A"),
(4, 	"B");

INSERT INTO subject VALUES 
/* id, 	name */	
(1, 	"Poligon"),
(2, 	"Cesta");

INSERT INTO instructor VALUES 
/* id, 	name, lastname, email, password, phone, licence  */
(1, 	"InstructorIme", "InstructorPriimek", "ins@mail.com", "geslogeslo123!", "123-456-789", "123456789");

INSERT INTO availability VALUES 
/* id, 		date_time 					FK_instructor*/	
(1, 		'2023-07-12 16:00:00',		null);

INSERT INTO driving_school VALUES 
/* id, 	name, 						email, 						password*/	
(1, 	"Ime avto sole",			"email@email.com", 			"geslo123");

INSERT INTO tariff VALUES 
/* id, 	FK_driving_school, 		service, 					service_price*/	
(1, 	1,						"1 ura voznje", 			"45.00"),
(2, 	1,						"paket 1", 					"120.00");
