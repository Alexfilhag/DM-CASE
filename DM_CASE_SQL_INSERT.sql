INSERT INTO Person (person_id, first_name, last_name, email, phone, ageGroup, consentToStoreData, role, enrollment_date) VALUES 
('101ch', 'Mortimer',    'Johnson',   'mortimersays@gmail.com', '+358406752421', NULL, 'Y', 'participant', '2020-04-03 12:15:31' ),
('102ch', 'Jessica',    'Thomas',   'jessicajess@gmail.com', '+358406612423', '18-50', 'Y', 'organiser', '2020-04-14 10:48:17'),
('103ch', 'Mia',    'Taylor',   'taylor.mia@gmail.com', '+358421352421', NULL, 'Y', 'participant', '2020-05-07 18:19:21'),
('104ch', 'Ava',    'Brown',   'avabrown92@gmail.com', '+358458444421', '18-50', 'Y', 'participant', '2020-02-28 06:15:01'),
('105ch', 'Harry',    'Wilson',   'harryw95@gmail.com', '+358446552444', '18-50', 'Y', 'participant', '2020-01-01 22:00:00'),
('106ch', 'Jack',    'Levis',   'levis2002@gmail.com', '+358406332520', '15-17', 'Y', 'organiser', '2020-02-18 20:58:40'),
('107ch', 'George',    'Evans',   'evansgeorge@gmail.com', '+358408262821', NULL, 'Y', 'participant', '2020-02-21 09:32:06'),
('108ch', 'Kevin', 'Belson', 'kevin@gmail.com', '+358963571125', '51-69', 'Y', 'participant', '2020-02-11 16:00:00'),
('109ch', 'Matti', 'Suolen', 'matti@gmail.com', '+358902479936', '51-69', 'Y', 'participant', '2020-03-16 16:01:09'),
('110ch', 'Maria', 'Marieva', 'maria@gmail.com', '+358902746398', '70+', 'Y', 'organiser', '2020-01-19 12:50:33'),
('111ch', 'Anna', 'Gerbin', 'anna@gmail.com', '+358412369812', '51-69', 'Y', 'organiser', '2020-05-08 13:08:20'),
('112ch', 'Evelina', 'Stoiminen', 'evelina@gmail.com', '+358789654123', '18-50', 'Y', 'participant', '2020-05-01 08:00:07'),
('113ch', 'Harry', 'Wilson', 'harry@gmail.com', '+358478963215', '18-50', 'Y', 'participant', '2020-05-02 07:11:12'),
('114ch', 'Ava', 'Brown', 'ava@gmail.com', '+358402578596', '18-50', 'Y', 'participant', '2020-04-13 18:24:50'),
('115ch', 'Martin', 'Kevin', 'martin@kevin.com', '+358478693215', '15-17', 'Y', 'participant', '2020-04-23 17:05:03')

INSERT INTO Tour (tour_id, name, description, date, isCancelled) VALUES
('11tr', 'Olympic Helisnki', 'Explore Olympic Helsinki, visit the most famous places of the 1952 Summer Olympics!', '2020-06-03', 'N'),
('12tr', 'Old Helsinki', 'Explore the old city of Helisnki! We will start from the Railway Station, and finish in Arabia!', '2020-06-20', 'N'),
('13tr', 'Urban Helsinki', 'Explore the modern Helsinki with all its modern architecture!', '2020-08-10', 'N'),
('14tr', 'Classical Helsinki', 'Explore the most significant cultural places, like museums and theathres!', '2020-07-03', 'N'),
('15tr', 'Natural Helisnki', 'Explore the nature of Helsinki! We will go through the fantastic landscapes', '2020-08-03', 'N')
INSERT INTO TourPerson (tour_id, person_id, partIsCancelled) VALUES
('11tr', '101ch', 'N'),
('11tr', '102ch', 'N'),
('12tr', '103ch', 'N'),
('12tr', '104ch', 'N'),
('12tr', '105ch', 'N'),
('12tr', '106ch', 'N'),
('12tr', '107ch', 'N'),
('13tr', '108ch', 'N'),
('13tr', '109ch', 'N'),
('13tr', '110ch', 'N'),
('13tr', '111ch', 'N'),
('13tr', '112ch', 'N'),
('13tr', '113ch', 'N'),
('13tr', '114ch', 'N'),
('14tr', '115ch', 'N')

INSERT INTO Site (site_id, name) VALUES
('001s', 'Velodrome'),
('002s', 'Kumpula swimming pool'),
('003s', 'Laakso Riding Hall'),
('004s', 'Tennispalatsi'),
('005s', 'Olympiaterminaali'),
('006s', 'Rautatieasema'),
('007s', 'Market Square'),
('008s', 'Temppeliaukio'),
('009s', 'Arabianranta'),
('010s', 'Vanhakaupunki' ),
('011s', 'Oodi'),
('012s', 'Kamppi'),
('013s', 'Helsingin yliopisto'),
('014s', 'Kallio'),
('015s', 'Aalto ylioisto'),
('016s', 'Sibelius Academy'),
('017s', 'Kiasma'),
('018s', 'Annantalo'),
('019s', 'Kanneltalo'),
('020s', 'Stoa'),
('021s', 'Eira'),
('022s', 'Kaivopuisto'),
('023s', 'Regatta'),
('024s', 'Sibelius monument'),
('025s', 'Gallen Kallen museo')

INSERT INTO TourSite (tour_id, site_id) VALUES
('11tr', '001s'),
('11tr', '002s'),
('11tr', '003s'),
('11tr', '004s'),
('11tr', '005s'),
('12tr', '006s'),
('12tr', '007s'),
('12tr', '008s'),
('12tr', '009s'),
('12tr', '010s'),
('13tr', '011s'),
('13tr', '012s'),
('13tr', '013s'),
('13tr', '014s'),
('13tr', '015s'),
('14tr', '016s'),
('14tr', '017s'),
('14tr', '018s'),
('14tr', '019s'),
('14tr', '020s'),
('15tr', '021s'),
('15tr', '022s'),
('15tr', '023s'),
('15tr', '024s'),
('15tr', '025s')

INSERT INTO Tag (tag_id, description) VALUES
('101t', '1952 Olympics'),
('102t', '1940'),
('103t', 'functionalism'),
('104t', 'old railway station'),
('105t', 'old market'),
('106t', 'old temple'),
('107t', 'old crafts'),
('108t', 'old center'),
('109t', 'fashion district'),
('110t', 'music art'),
('111t', 'modern art'),
('112t', 'central art'),
('113t', 'western art'),
('114t', 'eastern art'),
('115t', 'nature and city'),
('116t', 'fantastic nature')

INSERT INTO SiteTag (site_id, tag_id) VALUES
('001s', '101t'),
('001s', '102t'),
('002s', '101t'),
('003s', '103t'),
('004s', '104t'),
('005s', '105t'),
('006s', '106t'),
('007s', '106t'),
('008s', '108t'),
('009s', '109t'),
('010s', '110t'),
('011s', '111t'),
('012s', '112t'), 
('013s', '113t'),
('014s', '114t'),
('015s', '115t'),
('016s', '115t'),
('017s', '101t'),
('018s', '102t'),
('019s', '105t'),
('020s', '108t'),
('021s', '104t'),
('022s', '102t'),
('023s', '110t'),
('024s', '101t'),
('025s', '101t')
INSERT INTO SiteEvaluation ( site_id, person_id, description) VALUES

('007s', '103ch', 'Highly Recommend'),
( '008s', '104ch', 'Enjoyable'),
( '015s', '110ch', 'Okay'),
( '015s', '113ch', 'Only as a filler'),
( '014s', '108ch', 'Would never visit'),( '009s', '109ch', 'Would never visit')
