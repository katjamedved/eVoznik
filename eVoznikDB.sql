CREATE DATABASE IF NOT EXISTS eVoznikDB;
USE eVoznikDB;          


DROP TABLE IF EXISTS instructor;  
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS reg_code;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS signin_data;


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
    zip VARCHAR(255) NOT NULL, 
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    FK_signin_data INT
);

CREATE TABLE IF NOT EXISTS signin_data (
    id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL, 
    password VARCHAR(1000) NOT NULL 
);

CREATE TABLE IF NOT EXISTS reg_code (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    code VARCHAR(255) UNIQUE,
    exp_date DATE,
    FK_user INT
);

CREATE TABLE IF NOT EXISTS docs (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    pdfDoc BLOB
    
);

CREATE TABLE IF NOT EXISTS drives (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    
);

CREATE TABLE IF NOT EXISTS date_time (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    
    
);

/*
ALTER TABLE leads ADD CONSTRAINT FK_collectionName_L FOREIGN KEY (FK_collectionName_L) REFERENCES collection(id) ON DELETE CASCADE ON UPDATE NO ACTION;
*/

ALTER TABLE user ADD CONSTRAINT FK_signin_data FOREIGN KEY (FK_signin_data) REFERENCES signin_data(id) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE reg_code ADD CONSTRAINT FK_user FOREIGN KEY (FK_user) REFERENCES user(id) ON DELETE CASCADE ON UPDATE NO ACTION;

/*INSERT INTO size VALUES 
 id, 	name, 		lengthFrom, lengthTo	
(1, 	"S",		10, 		20),
(2, 	"M",		20, 		30),
(3, 	"L",		30, 		40);*/

INSERT INTO category VALUES 
/* id, 	name */	
(1, 	"A1"),
(2, 	"A2"),
(3, 	"A"),
(4, 	"B");

INSERT INTO instructor VALUES 
/* id, 	name, lastname, email, password, phone, licence  */
(1, 	"InstructorIme", "InstructorPriimek", "ins@mail.com", "geslogeslo123!", "123-456-789", "123456789");

INSERT INTO user VALUES 
/* id, 	nmb_document, 				name, 	lastname,  		phone, 			address, 			zip, 		city, 			country,  			signin_data*/	
(1, 	"PERSONALDOCNUMBER123",		"Ime", 	"Priimek", 	 	"123-456-789", 	"Ulica Ulica 123", 	"1000", 	"Ljubljana", 	"Slovenija", 		null);

