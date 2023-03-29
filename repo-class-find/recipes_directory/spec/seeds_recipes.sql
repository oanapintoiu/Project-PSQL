-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('Avocado Toast', '10 min', '5' );
INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('English Breakfast', '20 min', '3');
INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('Seafood Risotto', '40 min', '1');
INSERT INTO recipes (name, avg_cooking_time, rating) VALUES ('Tocanita', '70 min', '5');