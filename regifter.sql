-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code
You are now connected to database "regifter" as user "shaqualafredericks".
--
-- Write your code below each prompt
CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOL);
CREATE TABLE
--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOL);
CREATE TABLE
-- 
\echo See details of the table you created
-- 
\d gifts

-- 
\echo Alter the table so that the column price is changed to value  

ALTER TABLE gifts RENAME value TO price;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
NSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', 9, true);


--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts

--
\echo Uncomment below to insert 5 more gifts
-- 

-- INSERT INTO gifts (gift, giver, value, previously_regifted)
-- VALUES
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;

INSERT INTO gifts (gift, giver, price, previously_regifted)
 VALUES
 ('peach candle', 'Santa', 9, TRUE),
 ('cinnamon candle', 'Nick', 19, TRUE),
 ('soap on a rope', 'Rudolf', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
 ('mango candle', 'The Boss', 49, FALSE)
;-- 


\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('vase', 'Mom', 250, TRUE),
('crystal bowl', 'Sister', 200, TRUE),
('cinnamon apple candle', 'Daughter', 75, FALSE),
('bag', 'Cousin', 150, FALSE),
('comforter set', 'Brother', 89, TRUE);


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE price >= 20;


--
\echo Update the second gift to have a value of 2999
-- UPDATE gifts SET price = 2999 WHERE id = 2;


--
\echo Query for the updated item
--
UPDATE gifts SET price = 2999 WHERE id = 2 RETURNING *;


--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift) FROM gifts;

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(price) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2 ;
--
-- finish
--
DROP TABLE IF EXISTS gifts;

shaqualafredericks=# \i regifter.sql
psql:regifter.sql:2: ERROR:  database "regifter" is being accessed by other users
DETAIL:  There is 1 other session using the database.
psql:regifter.sql:3: ERROR:  database "regifter" already exists
You are now connected to database "regifter" as user "shaqualafredericks".
Create a table called gifts
See details of the table you created
Alter the table so that the column price is changed to value
Insert a peach candle, given by Santa thats value is 9 and has been previously regifted
Query for all the columns in your gifts table
Uncomment below to insert 5 more gifts
Insert 5 more gifts of your own choosing, include 1 more candle
Query for gifts with a price greater than or equal to 20
Query for every gift that has the word candle in it, only show the gift column
Query for every gift whose giver is Santa OR value is greater than 30
Query for every gift whose giver is NOT Santa
Update the second gift to have a value of 2999
Query for the updated item
Delete all the gifts from Santa and return the value and gift of the gift you have deleted
Query for all the columns in your gifts table one more time
Count the total number of gifts that have the word candle in it
Get the AVEREAGE value from all the gifts
Limit to 3 gifts, offset by 2 and order by price descending
DROP TABLE
regifter=# \d
Did not find any relations.
regifter=# CREATE TABLE gifts (
regifter(#         id SERIAL PRIMARY KEY,
regifter(#         gift TEXT,
regifter(#         giver TEXT,
regifter(#         value INT,
regifter(#         previously_regifted BOOLEAN
regifter(#     )
regifter-# ;
CREATE TABLE
regifter=# \dgifts
regifter=# \d gifts;
regifter=# ALTER TABLE gifts RENAME value TO price;
ALTER TABLE
regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', '9' true);
ERROR:  syntax error at or near "true"
LINE 3: ('peach candle', 'Santa', '9' true);
                                      ^
regifter=#
regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', 9 true);
ERROR:  syntax error at or near "true"
LINE 3: ('peach candle', 'Santa', 9 true);
                                    ^
regifter=#
regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', 9, true);
INSERT 0 1
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | price | previously_regifted
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
(1 row)

regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-#  VALUES
regifter-#  ('peach candle', 'Santa', 9, TRUE),
regifter-#  ('cinnamon candle', 'Nick', 19, TRUE),
regifter-#  ('soap on a rope', 'Rudolf', 29, FALSE),
regifter-# ('potpurri', 'Elf on the Shelf', 39, TRUE),
regifter-#  ('mango candle', 'The Boss', 49, FALSE)
regifter-# ;
INSERT 0 5
regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-# VALUES
regifter-# ('vase', 'Mom', 250, TRUE),
regifter-# ('crystal bowl', 'Sister', 200, TRUE),
regifter-# ('cinnamon apple candle', 'Daughter', 75, FALSE)
regifter-# ('bag', 'Cousin', 150, FALSE),
regifter-# ('comforter set', 'Brother', 89, TRUE);
ERROR:  syntax error at or near "("
LINE 6: ('bag', 'Cousin', 150, FALSE),
        ^
regifter=#
regifter=# INSERT INTO gifts (gift, giver, price, previously_regifted)
regifter-# VALUES
regifter-# ('vase', 'Mom', 250, TRUE),
regifter-# ('crystal bowl', 'Sister', 200, TRUE),
regifter-# ('cinnamon apple candle', 'Daughter', 75, FALSE),
regifter-# ('bag', 'Cousin', 150, FALSE),
regifter-# ('comforter set', 'Brother', 89, TRUE);
INSERT 0 5
regifter=# SELECT * FROM gifts WHERE price >= 20;
 id |         gift          |      giver       | price | previously_regifted
----+-----------------------+------------------+-------+---------------------
  4 | soap on a rope        | Rudolf           |    29 | f
  5 | potpurri              | Elf on the Shelf |    39 | t
  6 | mango candle          | The Boss         |    49 | f
  7 | vase                  | Mom              |   250 | t
  8 | crystal bowl          | Sister           |   200 | t
  9 | cinnamon apple candle | Daughter         |    75 | f
 10 | bag                   | Cousin           |   150 | f
 11 | comforter set         | Brother          |    89 | t
(8 rows)

regifter=# SELECT * FROM gifts WHERE gift LIKE '%candle%';
 id |         gift          |  giver   | price | previously_regifted
----+-----------------------+----------+-------+---------------------
  1 | peach candle          | Santa    |     9 | t
  2 | peach candle          | Santa    |     9 | t
  3 | cinnamon candle       | Nick     |    19 | t
  6 | mango candle          | The Boss |    49 | f
  9 | cinnamon apple candle | Daughter |    75 | f
(5 rows)

regifter=# SELECT * FROM gifts WHERE giver = 'Santa';
 id |     gift     | giver | price | previously_regifted
----+--------------+-------+-------+---------------------
  1 | peach candle | Santa |     9 | t
  2 | peach candle | Santa |     9 | t
(2 rows)

regifter=# SELECT * FROM gifts WHERE giver != 'Santa';
 id |         gift          |      giver       | price | previously_regifted
----+-----------------------+------------------+-------+---------------------
  3 | cinnamon candle       | Nick             |    19 | t
  4 | soap on a rope        | Rudolf           |    29 | f
  5 | potpurri              | Elf on the Shelf |    39 | t
  6 | mango candle          | The Boss         |    49 | f
  7 | vase                  | Mom              |   250 | t
  8 | crystal bowl          | Sister           |   200 | t
  9 | cinnamon apple candle | Daughter         |    75 | f
 10 | bag                   | Cousin           |   150 | f
 11 | comforter set         | Brother          |    89 | t
(9 rows)

regifter=# UPDATE gifts SET value = 2999 WHERE id = 2;
ERROR:  column "value" of relation "gifts" does not exist
LINE 1: UPDATE gifts SET value = 2999 WHERE id = 2;
                         ^
regifter=# UPDATE gifts SET price = 2999 WHERE id = 2;
UPDATE 1
regifter=#
regifter=# UPDATE gifts SET price = 2999 WHERE id = 2 RETURNING *;
 id |     gift     | giver | price | previously_regifted
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t
(1 row)

UPDATE 1
regifter=# DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;
 price |     gift
-------+--------------
     9 | peach candle
  2999 | peach candle
(2 rows)

DELETE 2
regifter=# SELECT * FROM gifts;
 id |         gift          |      giver       | price | previously_regifted
----+-----------------------+------------------+-------+---------------------
  3 | cinnamon candle       | Nick             |    19 | t
  4 | soap on a rope        | Rudolf           |    29 | f
  5 | potpurri              | Elf on the Shelf |    39 | t
  6 | mango candle          | The Boss         |    49 | f
  7 | vase                  | Mom              |   250 | t
  8 | crystal bowl          | Sister           |   200 | t
  9 | cinnamon apple candle | Daughter         |    75 | f
 10 | bag                   | Cousin           |   150 | f
 11 | comforter set         | Brother          |    89 | t
(9 rows)

regifter=# SELECT COUNT(gift) FROM gifts;
 count
-------
     9
(1 row)

regifter=# SELECT AVG(price) FROM gifts;
         avg
----------------------
 100.0000000000000000
(1 row)

regifter=# SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2 ;
 id |         gift          |  giver   | price | previously_regifted
----+-----------------------+----------+-------+---------------------
 10 | bag                   | Cousin   |   150 | f
 11 | comforter set         | Brother  |    89 | t
  9 | cinnamon apple candle | Daughter |    75 | f
(3 rows)

regifter=# \d
                   List of relations
 Schema |     Name     |   Type   |       Owner
--------+--------------+----------+--------------------
 public | gifts        | table    | shaqualafredericks
 public | gifts_id_seq | sequence | shaqualafredericks
(2 rows)

regifter=# q
regifter-# \q