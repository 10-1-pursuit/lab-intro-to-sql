-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INTEGER, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 

\d gifts

-- 
\echo Alter the table so that the column price is changed to value 
-- 

ALTER TABLE gifts RENAME value TO price;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted) VALUES ('Peach Candle', 'Santa', 9, true);


--
\echo Query for all the columns in your gifts table
-- 

SELECT * FROM gifts;

--  id |      gift       |      giver       | price | previously_regifted
-- ----+-----------------+------------------+-------+---------------------
--   1 | Peach Candle    | Santa            |     9 | t
--   2 | peach candle    | Santa            |     9 | t
--   3 | cinnamon candle | Nick             |    19 | t
--   4 | soap on a rope  | Rudolf           |    29 | f
--   5 | potpurri        | Elf on the Shelf |    39 | t
--   6 | mango candle    | The Boss         |    49 | f
--   7 | bergamot candle | Julius           |    11 | f
--   8 | nutmeg candle   | Nicki            |    22 | f
--   9 | shea soap       | Rudy             |     2 | t
--  10 | potpie          | Sandy Cheeks     |    13 | f
--  11 | mango           | Ken The Boss     |     4 | f
-- (11 rows)

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('bergamot candle', 'Julius', '11', FALSE),
('nutmeg candle', 'Nicki', '22', FALSE),
('shea soap', 'Rudy', '2', TRUE),
('potpie', 'Sandy Cheeks', '13', FALSE),
('mango', 'Ken The Boss', '4', FALSE)
;

--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts WHERE price >= 20;

--  id |      gift      |      giver       | price | previously_regifted
-- ----+----------------+------------------+-------+---------------------
--   4 | soap on a rope | Rudolf           |    29 | f
--   5 | potpurri       | Elf on the Shelf |    39 | t
--   6 | mango candle   | The Boss         |    49 | f
--   8 | nutmeg candle  | Nicki            |    22 | f
-- (4 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift LIKE '%candle%';

--  id |      gift       |  giver   | price | previously_regifted
-- ----+-----------------+----------+-------+---------------------
--   2 | peach candle    | Santa    |     9 | t
--   3 | cinnamon candle | Nick     |    19 | t
--   6 | mango candle    | The Boss |    49 | f
--   7 | bergamot candle | Julius   |    11 | f
--   8 | nutmeg candle   | Nicki    |    22 | f
-- (5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;

--  id |     gift     |      giver       | price | previously_regifted
-- ----+--------------+------------------+-------+---------------------
--   1 | Peach Candle | Santa            |     9 | t
--   2 | peach candle | Santa            |     9 | t
--   5 | potpurri     | Elf on the Shelf |    39 | t
--   6 | mango candle | The Boss         |    49 | f

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT * FROM gifts WHERE giver != 'Santa';

--  id |      gift       |      giver       | price | previously_regifted
-- ----+-----------------+------------------+-------+---------------------
--   3 | cinnamon candle | Nick             |    19 | t
--   4 | soap on a rope  | Rudolf           |    29 | f
--   5 | potpurri        | Elf on the Shelf |    39 | t
--   6 | mango candle    | The Boss         |    49 | f
--   7 | bergamot candle | Julius           |    11 | f
--   8 | nutmeg candle   | Nicki            |    22 | f
--   9 | shea soap       | Rudy             |     2 | t
--  10 | potpie          | Sandy Cheeks     |    13 | f
--  11 | mango           | Ken The Boss     |     4 | f
-- (9 rows)

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gifts SET price= 2999 WHERE id=2;
-- UPDATE 1

--
\echo Query for the updated item
--
SELECT * FROM gifts WHERE id=2 AND price=2999;

--  id |     gift     | giver | price | previously_regifted
-- ----+--------------+-------+-------+---------------------
--   2 | peach candle | Santa |  2999 | t
-- (1 row)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver='Santa' RETURNING price, gift;

--  price |     gift
-- -------+--------------
--      9 | Peach Candle
--   2999 | peach candle
-- (2 rows)

-- DELETE 2

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

--  id |      gift       |      giver       | price | previously_regifted
-- ----+-----------------+------------------+-------+---------------------
--   3 | cinnamon candle | Nick             |    19 | t
--   4 | soap on a rope  | Rudolf           |    29 | f
--   5 | potpurri        | Elf on the Shelf |    39 | t
--   6 | mango candle    | The Boss         |    49 | f
--   7 | bergamot candle | Julius           |    11 | f
--   8 | nutmeg candle   | Nicki            |    22 | f
--   9 | shea soap       | Rudy             |     2 | t
--  10 | potpie          | Sandy Cheeks     |    13 | f
--  11 | mango           | Ken The Boss     |     4 | f
-- (9 rows)

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 


--
\echo Get the AVEREAGE value from all the gifts
--


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;
