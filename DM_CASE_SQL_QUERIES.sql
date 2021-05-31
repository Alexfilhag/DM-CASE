

-- Who are the organizers of the tours organized 2020-06-03?
SELECT Person.person_id, first_name, last_name FROM Person
JOIN TourPerson ON (TourPerson.person_id = Person.person_id)
JOIN Tour ON (Tour.tour_id = TourPerson.tour_id)
WHERE Person.role = 'organiser' AND Tour.date = '2020-06-03'
ORDER BY Person.first_name;





--What are all the tags that can be associated to a certain tour X?
SELECT DISTINCT (Tag.tag_id), Tag.description, Tour.name FROM Tag
JOIN SiteTag ON (Tag.tag_id = SiteTag.tag_id)
JOIN Site ON (SiteTag.site_id = Site.site_id)
JOIN TourSite ON  (Site.site_id = TourSite.site_id)
JOIN Tour ON (TourSite.tour_id = Tour.tour_id)
WHERE Tour.tour_id = '11tr'






--List of tours on a certain day, and along each tour the list of tags for each tour.

SELECT Tour.name, Tag.description FROM Tag
JOIN SiteTag ON (Tag.tag_id = SiteTag.tag_id)
JOIN Site ON (SiteTag.site_id = Site.site_id)
JOIN TourSite ON  (Site.site_id = TourSite.site_id)
JOIN Tour ON (TourSite.tour_id = Tour.tour_id)
WHERE Tour.date = '2020-06-20'






--Full report of tour X attendees: organizer + enrollees with their names and agegroup

SELECT Person.last_name, Person.first_name, ageGroup, role FROM Person
JOIN TourPerson ON (TourPerson.person_id = Person.person_id)
JOIN Tour ON (Tour.tour_id = TourPerson.tour_id)
WHERE Tour.tour_id = '12tr';






--The itinerary for tour X, the way points = sites in order, and the tags for each site

SELECT Tour.name, Tag.description AS 'Tag', Site.name AS 'Site' FROM Tour
JOIN TourSite ON (TourSite.tour_id = Tour.tour_id)
JOIN Site ON  (Site.site_id = TourSite.site_id)
JOIN SiteTag ON (SiteTag.site_id = Site.site_id)
JOIN Tag ON (Tag.tag_id = SiteTag.tag_id)
WHERE Tour.tour_id = '13tr'





-- What tags are not yet in use = not used by any site?

SELECT *
FROM  Tag
WHERE  NOT EXISTS (SELECT * FROM SiteTag WHERE  Tag.tag_id = SiteTag.tag_id)







--Which sites have lowest evaluations by the biggest agegroup?
SELECT TOP 1 COUNT(Person.person_id) AS 'Highest number of people', Site.name, SiteEvaluation.description, Person.ageGroup FROM Person
JOIN SiteEvaluation ON (SiteEvaluation.person_id = Person.person_id)
JOIN Site ON (SiteEvaluation.site_id = Site.site_id)
AND description = 'Would never visit'
WHERE ageGroup IS NOT NULL
GROUP BY ageGroup, Site.name, SiteEvaluation.description
ORDER BY 'Highest number of people' DESC







--Listing available tours with their enrolment count and sites to be visited
SELECT COUNT(TourPerson.person_id) AS 'Number of people',  Tour.name AS 'Tour name', (Site.name) AS 'Site name'  FROM TourPerson
JOIN Tour ON (TourPerson.tour_id = Tour.tour_id)
JOIN TourSite ON (TourSite.tour_id = Tour.tour_id)
JOIN Site ON (Site.site_id = TourSite.site_id)
GROUP BY Tour.name, Site.name
ORDER BY Tour.name





--Making an enrolment for a tour
INSERT INTO Person
(person_id, first_name, last_name, email, phone, ageGroup, consentToStoreData, role, enrollment_date)
VALUES
('116ch', 'Curtis', 'Birdseed', 'curtisonair@gmail.com', '+358406180427', '15-17', 'Y', 'organiser', GETDATE())

INSERT INTO TourPerson
(tour_id, person_id, partIsCancelled)
VALUES
('14tr', '116ch', 'N')



--Cancelling a tour enrolment
UPDATE TourPerson
SET partIsCancelled = 'Y'
WHERE tour_id = '12tr' AND person_id = '104ch' --('tour_id, person_id' OR 'tour_id AND person_id')


--Listing the waypoints (Sites) of a tour
SELECT name 
FROM Site
JOIN TourSite ON(Site.site_id = TourSite.site_id)
WHERE TourSite.tour_id = '11tr'




--Listing the Sites and reading the details of each site, e.g. the tags related to the site. 
SELECT  Site.name, Tag.description
FROM Site
JOIN SiteTag ON (Site.site_id = SiteTag.site_id)
JOIN Tag ON (SiteTag.tag_id = Tag.tag_id)
WHERE Site.site_id = '001s'





--Emailing all enrolled people in the case of a cancelled tour.
SELECT Person.email FROM Tour
JOIN TourPerson ON (Tour.tour_id = TourPerson.tour_id)
JOIN Person ON (TourPerson.person_id = Person.person_id)
WHERE Tour.isCancelled = 'Y'



--10. Even if customer is encouraged to select the age group, this is not obligatory. So, we might have
--customers for whom the age group is not specified.

SELECT first_name, last_name, ageGroup FROM Person
WHERE agegroup is NULL


--11. For the organizer: Listing names (and possible age groups) for all customers of a tour.

SELECT first_name, ageGroup 
FROM Person
JOIN TourPerson ON (Person.person_id = TourPerson.person_id)
JOIN Tour ON (Tour.tour_id = TourPerson.tour_id)
WHERE role = 'participant' AND Tour.tour_id = '13tr'





