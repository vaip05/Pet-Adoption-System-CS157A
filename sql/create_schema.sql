DROP DATABASE IF EXISTS pet_adoption;
CREATE DATABASE pet_adoption;
USE pet_adoption;

CREATE TABLE shelters (
    shelter_id INT PRIMARY KEY AUTO_INCREMENT,
    shelter_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE pets (
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    breed VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    availability_status VARCHAR(20) NOT NULL,
    shelter_id INT NOT NULL,
    FOREIGN KEY (shelter_id) REFERENCES shelters(shelter_id)
);

CREATE TABLE adopters (
    adopter_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE adoption_applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    adopter_id INT NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
    FOREIGN KEY (adopter_id) REFERENCES adopters(adopter_id)
);