CREATE TABLE user_venera  
(id serial not null,
   user_name varchar(50) not null,
   level_id serial not null,
  skill integer);

Создала таблицу level:
 CREATE TABLE level  
 (id serial not null,
   level_name varchar(50) not null);

Внесла данные в таблицы:
INSERT INTO user_venera  (id, user_name, level_id, skill)  
VALUES (default, 'Anton', 1, 900000), (default, 'Denis', 3, 4000),
   (default, 'Petr', 2, 50000), (default, 'Andrey', 4, 20),  (default, 'Olga', 1, 600000),
   (default, 'Anna', 1, 1600000);

INSERT INTO level  (id, level_name)  
VALUES (default, 'admin'), (default, 'power_user'), (default, 'user'), (default, 'guest');


Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а								
SELECT user_name FROM user_venera
WHERE level_id=1 AND skill > 799000 AND user_name LIKE '%a%';
При таком запросе выходило только одно имя - Анна, но по таблице видела, что  имен с “а”, больше, чем 1. 
Нашла, что в синтаксисе PostgreSQL прописывается ILIKE

SELECT user_name FROM user_venera
WHERE level_id=1 AND skill > 799000 AND user_name ILIKE '%a%';
При таком запросе выходило имя - Анна, Антон

Удалить всех пользователей, у которых skill меньше 100000
DELETE FROM user_venera WHERE skill < 100000;

Вывести все данные из таблицы user в порядке убывания по полю skill 								
SELECT * FROM user_venera ORDER BY skill DESC

Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
INSERT INTO user_venera  (id, user_name, level_id, skill)  
VALUES (default, 'Oleg', 4, 10);

Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000
UPDATE user_venera SET skill=2000000 WHERE level_id < 2								
Выбрать user_name всех пользователей уровня admin используя подзапрос								
SELECT user_name FROM user_venera WHERE level_id = (SELECT ID FROM level WHERE level_name ='admin');

Выбрать user_name всех пользователей уровня admin используя join	
SELECT u.user_name, l.level_name FROM user_venera as u
JOIN level as l on l.id=u.level_id WHERE level_name ='admin';

