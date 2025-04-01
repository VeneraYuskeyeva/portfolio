--Task: Create a table "user_venera"
Solution:	
CREATE TABLE user_venera  
(id serial not null,
   user_name varchar(50) not null,
   level_id serial not null,
  skill integer);

Task: Create a table "level"
Solution:
 CREATE TABLE level  
 (id serial not null,
   level_name varchar(50) not null);

Task: Enter data into the table:
Solution:	
INSERT INTO user_venera  (id, user_name, level_id, skill)  
VALUES (default, 'Anton', 1, 900000), (default, 'Denis', 3, 4000),
   (default, 'Petr', 2, 50000), (default, 'Andrey', 4, 20),
   (default, 'Olga', 1, 600000),
   (default, 'Anna', 1, 1600000);

Task: Enter data into the table:
Solution:
INSERT INTO level  (id, level_name)  
VALUES (default, 'admin'), (default, 'power_user'), (default, 'user'), (default, 'guest');

Task: Select from the user table all users with level_id=1, skill > 799000 and the letter "a" in their name.
Solution:									
SELECT user_name FROM user_venera
WHERE level_id=1 AND skill > 799000 AND user_name LIKE '%a%';

Task: Remove all users with skill less than 100000
Solution:	
DELETE FROM user_venera WHERE skill < 100000;

Task: Output all data from the user table in descending order by skill field	
Solution:								
SELECT * FROM user_venera ORDER BY skill DESC

Task: Add a new user with name Oleg with level 4 and skill =10 to the user table							
Solution:	
INSERT INTO user_venera  (id, user_name, level_id, skill)  
VALUES (default, 'Oleg', 4, 10);

Task: Update data in user table - for users with level_id less than 2 set skill 2000000
Solution:	
UPDATE user_venera SET skill=2000000 WHERE level_id < 2			
  
Task: Select user_name of all admin level users using subquery								
Solution:	
SELECT user_name FROM user_venera WHERE level_id = (SELECT ID FROM level WHERE level_name ='admin');

Task: Select user_name of all admin level users using join	
Solution:	  
SELECT u.user_name, l.level_name FROM user_venera as u
JOIN level as l on l.id=u.level_id WHERE level_name ='admin';

