USE pet_adoption_system;
USE pet_adoption;

INSERT INTO shelters (shelter_name, location, contact_number, email) VALUES
('Happy Tails Shelter', 'San Jose, CA', '408-555-1001', 'contact1@happytails.org'),
('Paws and Hearts Rescue', 'Santa Clara, CA', '408-555-1002', 'contact2@pawshearts.org'),
('Golden State Pets', 'Sunnyvale, CA', '408-555-1003', 'contact3@goldenpets.org'),
('Forever Home Center', 'Milpitas, CA', '408-555-1004', 'contact4@foreverhome.org'),
('Bay Area Animal Haven', 'Campbell, CA', '408-555-1005', 'contact5@animalhaven.org'),
('Safe Paws Shelter', 'Cupertino, CA', '408-555-1006', 'contact6@safepaws.org'),
('Fur Friends House', 'San Mateo, CA', '408-555-1007', 'contact7@furfriends.org'),
('Hope for Paws Home', 'Palo Alto, CA', '408-555-1008', 'contact8@hopeforpaws.org'),
('Companion Care Shelter', 'Mountain View, CA', '408-555-1009', 'contact9@companioncare.org'),
('Pet Promise Rescue', 'Fremont, CA', '408-555-1010', 'contact10@petpromise.org'),
('Animal Joy Center', 'Los Gatos, CA', '408-555-1011', 'contact11@animaljoy.org'),
('Second Chance Pets', 'Morgan Hill, CA', '408-555-1012', 'contact12@secondchance.org'),
('Caring Tails Shelter', 'Gilroy, CA', '408-555-1013', 'contact13@caringtails.org'),
('Little Paws Place', 'Saratoga, CA', '408-555-1014', 'contact14@littlepaws.org'),
('Homeward Bound Pets', 'Redwood City, CA', '408-555-1015', 'contact15@homewardbound.org');

INSERT INTO adopters (full_name, address, phone_number, email) VALUES
('Ava Thompson', '101 Main St, San Jose, CA', '669-555-2001', 'ava@example.com'),
('Noah Martinez', '202 Oak Ave, Santa Clara, CA', '669-555-2002', 'noah@example.com'),
('Emma Johnson', '303 Pine Rd, Sunnyvale, CA', '669-555-2003', 'emma@example.com'),
('Liam Brown', '404 Cedar Ln, Milpitas, CA', '669-555-2004', 'liam@example.com'),
('Sophia Garcia', '505 Maple Dr, Campbell, CA', '669-555-2005', 'sophia@example.com'),
('Mason Davis', '606 Willow Ct, Cupertino, CA', '669-555-2006', 'mason@example.com'),
('Isabella Rodriguez', '707 Birch Blvd, San Mateo, CA', '669-555-2007', 'isabella@example.com'),
('Ethan Wilson', '808 Walnut St, Palo Alto, CA', '669-555-2008', 'ethan@example.com'),
('Mia Anderson', '909 Spruce Way, Mountain View, CA', '669-555-2009', 'mia@example.com'),
('James Thomas', '111 Cherry Cir, Fremont, CA', '669-555-2010', 'james@example.com'),
('Charlotte Taylor', '121 Aspen St, Los Gatos, CA', '669-555-2011', 'charlotte@example.com'),
('Benjamin Moore', '131 Palm Ave, Morgan Hill, CA', '669-555-2012', 'benjamin@example.com'),
('Amelia Jackson', '141 Ivy Rd, Gilroy, CA', '669-555-2013', 'amelia@example.com'),
('Lucas Martin', '151 Cypress Dr, Saratoga, CA', '669-555-2014', 'lucas@example.com'),
('Harper Lee', '161 Rose Ln, Redwood City, CA', '669-555-2015', 'harper@example.com');

INSERT INTO pets (name, age, breed, gender, availability_status, shelter_id) VALUES
('Bella', 2, 'Labrador Retriever', 'Female', 'Available', 1),
('Max', 3, 'German Shepherd', 'Male', 'Available', 2),
('Luna', 1, 'Siamese Cat', 'Female', 'Pending', 3),
('Charlie', 4, 'Beagle', 'Male', 'Available', 4),
('Lucy', 5, 'Persian Cat', 'Female', 'Adopted', 5),
('Cooper', 2, 'Golden Retriever', 'Male', 'Available', 6),
('Daisy', 3, 'Bulldog', 'Female', 'Available', 7),
('Rocky', 6, 'Boxer', 'Male', 'Pending', 8),
('Milo', 1, 'Tabby Cat', 'Male', 'Available', 9),
('Lola', 2, 'Poodle', 'Female', 'Available', 10),
('Bailey', 4, 'Husky', 'Female', 'Available', 11),
('Buddy', 5, 'Corgi', 'Male', 'Adopted', 12),
('Nala', 2, 'Maine Coon', 'Female', 'Available', 13),
('Teddy', 3, 'Shih Tzu', 'Male', 'Available', 14),
('Zoe', 1, 'Chihuahua', 'Female', 'Pending', 15);

INSERT INTO adoption_applications (pet_id, adopter_id, application_date, status) VALUES
(1, 1, '2026-04-01', 'Pending'),
(2, 2, '2026-04-02', 'Approved'),
(3, 3, '2026-04-03', 'Rejected'),
(4, 4, '2026-04-04', 'Pending'),
(5, 5, '2026-04-05', 'Approved'),
(6, 6, '2026-04-06', 'Pending'),
(7, 7, '2026-04-07', 'Rejected'),
(8, 8, '2026-04-08', 'Pending'),
(9, 9, '2026-04-09', 'Approved'),
(10, 10, '2026-04-10', 'Pending'),
(11, 11, '2026-04-11', 'Rejected'),
(12, 12, '2026-04-12', 'Approved'),
(13, 13, '2026-04-13', 'Pending'),
(14, 14, '2026-04-14', 'Approved'),
(15, 15, '2026-04-15', 'Pending');
