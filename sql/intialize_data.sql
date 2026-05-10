USE pet_adoption;

INSERT INTO shelters (shelter_name, location, contact_number, email) VALUES
('Happy Paws Shelter', 'San Jose, CA', '408-555-1001', 'happy@paws.org'),
('Safe Haven Pets', 'Santa Clara, CA', '408-555-1002', 'safehaven@pets.org'),
('Furry Friends Rescue', 'Sunnyvale, CA', '408-555-1003', 'furry@friends.org'),
('Hope Animal Center', 'Milpitas, CA', '408-555-1004', 'hope@animals.org'),
('Paws and Claws', 'Cupertino, CA', '408-555-1005', 'contact@pawsclaws.org'),
('Second Chance Shelter', 'Campbell, CA', '408-555-1006', 'secondchance@shelter.org'),
('Loving Tails Rescue', 'Mountain View, CA', '408-555-1007', 'tails@rescue.org'),
('Animal Care House', 'Los Gatos, CA', '408-555-1008', 'care@animalhouse.org'),
('Forever Home Shelter', 'Fremont, CA', '510-555-1009', 'forever@home.org'),
('Kind Hearts Rescue', 'Palo Alto, CA', '650-555-1010', 'kindhearts@rescue.org'),
('Pet Hope Center', 'Morgan Hill, CA', '408-555-1011', 'hope@petcenter.org'),
('Rescue Ranch', 'Gilroy, CA', '408-555-1012', 'ranch@rescue.org'),
('New Life Pets', 'Redwood City, CA', '650-555-1013', 'newlife@pets.org'),
('City Animal Shelter', 'Oakland, CA', '510-555-1014', 'city@animals.org'),
('Golden Paw Rescue', 'San Mateo, CA', '650-555-1015', 'golden@paw.org');

INSERT INTO pets (name, age, breed, gender, availability_status, shelter_id) VALUES
('Buddy', 3, 'Labrador Retriever', 'Male', 'Available', 1),
('Luna', 2, 'Siamese Cat', 'Female', 'Available', 2),
('Max', 5, 'German Shepherd', 'Male', 'Pending', 3),
('Bella', 1, 'Golden Retriever', 'Female', 'Available', 4),
('Charlie', 4, 'Beagle', 'Male', 'Available', 5),
('Daisy', 2, 'Poodle', 'Female', 'Adopted', 6),
('Rocky', 6, 'Boxer', 'Male', 'Available', 7),
('Milo', 3, 'Tabby Cat', 'Male', 'Pending', 8),
('Coco', 1, 'Chihuahua', 'Female', 'Available', 9),
('Sadie', 4, 'Husky', 'Female', 'Available', 10),
('Oscar', 2, 'Maine Coon', 'Male', 'Available', 11),
('Ruby', 5, 'Corgi', 'Female', 'Adopted', 12),
('Toby', 3, 'Dachshund', 'Male', 'Available', 13),
('Nala', 2, 'Persian Cat', 'Female', 'Available', 14),
('Leo', 1, 'Mixed Breed', 'Male', 'Pending', 15);

INSERT INTO adopters (full_name, address, phone_number, email) VALUES
('Aarav Patel', '101 First St, San Jose, CA', '408-555-2001', 'aarav.patel@email.com'),
('Sophia Nguyen', '202 Second St, Santa Clara, CA', '408-555-2002', 'sophia.nguyen@email.com'),
('Miguel Garcia', '303 Third St, Sunnyvale, CA', '408-555-2003', 'miguel.garcia@email.com'),
('Emily Johnson', '404 Fourth St, Milpitas, CA', '408-555-2004', 'emily.johnson@email.com'),
('Daniel Kim', '505 Fifth St, Cupertino, CA', '408-555-2005', 'daniel.kim@email.com'),
('Priya Shah', '606 Sixth St, Campbell, CA', '408-555-2006', 'priya.shah@email.com'),
('James Wilson', '707 Seventh St, Mountain View, CA', '650-555-2007', 'james.wilson@email.com'),
('Olivia Martinez', '808 Eighth St, Los Gatos, CA', '408-555-2008', 'olivia.martinez@email.com'),
('Ethan Brown', '909 Ninth St, Fremont, CA', '510-555-2009', 'ethan.brown@email.com'),
('Mia Davis', '111 Tenth St, Palo Alto, CA', '650-555-2010', 'mia.davis@email.com'),
('Noah Lee', '222 Oak Ave, Morgan Hill, CA', '408-555-2011', 'noah.lee@email.com'),
('Ava Thompson', '333 Pine Ave, Gilroy, CA', '408-555-2012', 'ava.thompson@email.com'),
('Lucas Anderson', '444 Maple Ave, Redwood City, CA', '650-555-2013', 'lucas.anderson@email.com'),
('Isabella Clark', '555 Cedar Ave, Oakland, CA', '510-555-2014', 'isabella.clark@email.com'),
('Mason Hall', '666 Birch Ave, San Mateo, CA', '650-555-2015', 'mason.hall@email.com');

INSERT INTO adoption_applications (pet_id, adopter_id, application_date, status) VALUES
(1, 1, '2026-04-01', 'Pending'),
(2, 2, '2026-04-02', 'Approved'),
(3, 3, '2026-04-03', 'Pending'),
(4, 4, '2026-04-04', 'Rejected'),
(5, 5, '2026-04-05', 'Pending'),
(6, 6, '2026-04-06', 'Approved'),
(7, 7, '2026-04-07', 'Pending'),
(8, 8, '2026-04-08', 'Pending'),
(9, 9, '2026-04-09', 'Approved'),
(10, 10, '2026-04-10', 'Rejected'),
(11, 11, '2026-04-11', 'Pending'),
(12, 12, '2026-04-12', 'Approved'),
(13, 13, '2026-04-13', 'Pending'),
(14, 14, '2026-04-14', 'Pending'),
(15, 15, '2026-04-15', 'Rejected');
