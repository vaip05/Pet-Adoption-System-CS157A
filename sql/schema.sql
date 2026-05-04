CREATE DATABASE IF NOT EXISTS pet_adoption_system;
USE pet_adoption;
USE pet_adoption_system;

DROP TABLE IF EXISTS adoption_applications;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS adopters;
DROP TABLE IF EXISTS shelters;

CREATE TABLE shelters (
    shelter_id INT PRIMARY KEY AUTO_INCREMENT,
    shelter_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE adopters (
    adopter_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE pets (
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    age INT NOT NULL,
    breed VARCHAR(80) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    availability_status VARCHAR(20) NOT NULL,
    shelter_id INT NOT NULL,
    CONSTRAINT chk_pet_age CHECK (age >= 0),
    CONSTRAINT chk_availability CHECK (availability_status IN ('Available', 'Pending', 'Adopted')),
    CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female')),
    CONSTRAINT fk_pets_shelter FOREIGN KEY (shelter_id) REFERENCES shelters(shelter_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE adoption_applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    adopter_id INT NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_application_status CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    CONSTRAINT fk_app_pet FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_app_adopter FOREIGN KEY (adopter_id) REFERENCES adopters(adopter_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
