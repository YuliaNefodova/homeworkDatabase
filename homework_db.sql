CREATE DATABASE homework_db;

CREATE SEQUENCE base_sequence START WITH 1  INCREMENT BY 1 ;

CREATE TABLE streets
(
	id SERIAL PRIMARY KEY,
	name VARCHAR
);

CREATE TABLE Person
(
	Id SERIAL PRIMARY KEY,
	FirstName VARCHAR,
	LastName VARCHAR,
	Age INTEGER,
	Id_Street INTEGER REFERENCES Street(id)
);

INSERT INTO Street(Id, Name) VALUES
(nextval('base_sequence'), 'Allen Street'),
(nextval('base_sequence'), 'Perry Street  '),
(nextval('base_sequence'), 'St. Marks Place'),
(nextval('base_sequence'), 'Tiemann Place'),
(nextval('base_sequence'), 'Stuyvesant Street'),
(nextval('base_sequence'), 'Beach Street'),
(nextval('base_sequence'), 'Cabrini Boulevard'),
(nextval('base_sequence'), 'Delancey Street'),
(nextval('base_sequence'), 'Eldridge Street'),
(nextval('base_sequence'), 'Fulton Street'),
(nextval('base_sequence'), 'Gay Street'),
(nextval('base_sequence'), 'Jane Street'),
(nextval('base_sequence'), 'Malcolm X Boulevard'),
(nextval('base_sequence'), 'Nassau Street');

INSERT INTO Person (Id, FirstName, LastName, Age, Id_Street) VALUES
(nextval('base_sequence'), 'Sophia', 'Smith', 34, (SELECT Id FROM Street WHERE Name = 'Perry Street')),
(nextval('base_sequence'), 'Jacob', 'Johnson', 56, (SELECT Id FROM Street WHERE Name = 'St. Marks Place')),
(nextval('base_sequence'), 'Isabella', 'Williams', 27, (SELECT Id FROM Street WHERE Name = 'Tiemann Place')),
(nextval('base_sequence'), 'Mason', 'Brown', 89, (SELECT Id FROM Street WHERE Name = 'Stuyvesant Street')),
(nextval('base_sequence'), 'Emma', 'Jones', 47, (SELECT Id FROM Street WHERE Name = 'Beach Street')),
(nextval('base_sequence'), 'William', 'Garcia', 31, (SELECT Id FROM Street WHERE Name = 'Cabrini Boulevard')),
(nextval('base_sequence'), 'Olivia', 'Miller', 18, (SELECT Id FROM Street WHERE Name = 'Delancey Street')),
(nextval('base_sequence'), 'Jayden', 'Davis', 62, (SELECT Id FROM Street WHERE Name = 'Eldridge Street')),
(nextval('base_sequence'), 'Ava', 'Rodriguez', 49, (SELECT Id FROM Street WHERE Name = 'Fulton Street')),
(nextval('base_sequence'), 'Noah', 'Martinez', 23, (SELECT Id FROM Street WHERE Name = 'Gay Street')),
(nextval('base_sequence'), 'Emily', 'Hernandez', 68, (SELECT Id FROM Street WHERE Name = 'Gay Street')),
(nextval('base_sequence'), 'Michael', 'Lopez', 34, (SELECT Id FROM Street WHERE Name = 'Gay Street')),
(nextval('base_sequence'), 'Abigail', 'Wilson', 20, (SELECT Id FROM Street WHERE Name = 'Jane Street')),
(nextval('base_sequence'), 'Ethan', 'Gonzalez', 50, (SELECT Id FROM Street WHERE Name = 'Nassau Street'));

--Выв общее число жителей.
SELECT COUNT(*) AS Id
FROM Person;

--Вывести средний возраст жителей.
SELECT AVG(Age)
FROM Person;

--Вывести отсортированный по алфавиту список фамилий без повторений
SELECT LastName
FROM Person
GROUP BY LastName
ORDER BY LastName ASC;

-- Вывести список фамилий, с указанием количества повторений этих фамилий в общем списке
SELECT LastName, COUNT(*) AS LastName
FROM Person
GROUP BY LastName;

--Вывести фамилии, которые содержат в середине букву «б»
SELECT LastName
FROM Person
WHERE LastName LIKE 'B%';

--Вывести список «бомжей»
SELECT FirstName, LastName
FROM Person
WHERE Id_Street IS NULL;

--Вывести список несовершеннолетних, проживающих на определенной улице
SELECT p.FirstName, p.LastName
FROM Person p INNER JOIN Street s ON p.Id_Street = s.Id
WHERE lower(s.Name) = lower('Beach Street') AND p.Age < 18;

--Вывести упорядоченный по алфавиту список всех улиц с указанием, сколько жильцов живёт на улице
SELECT s.Name, COUNT(p.Id_street) AS StreetCount
FROM Street s INNER JOIN Person p ON s.Id = p.Id_street
GROUP BY s.Name
ORDER BY s.Name ASC;

--Вывести список улиц, название которых состоит из 6-ти букв
SELECT Name
FROM Street
WHERE LENGTH(Name) = 6

--Вывести список улиц с количеством жильцов на них меньше 3.
SELECT s.Name AS Street
FROM Street s INNER JOIN Person p ON s.Id = p.Id_Street
GROUP BY Name
HAVING COUNT(s.Name) < 3;





