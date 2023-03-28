SELECT id, title, release_year
  FROM albums
  WHERE id = 2;

  SELECT id, title, release_year
  FROM albums
  WHERE title = 'Doolittle';

  SELECT id, title, release_year
  FROM albums
  WHERE release_year > 1990;

  SELECT id, title, release_year, artist_id
  FROM albums
  WHERE release_year > 1989 AND artist_id = 1;

--   QUERYING DATA 

 ** EXERCISE 1: **
SELECT release_year FROM albums;

 ** EXERCISE 2: **
SELECT release_year FROM albums; WHERE title = 'Bossanova';

 ** EXERCISE 3: **
SELECT id, title, release_year
SELECT release_year 
FROM albums; 
WHERE artist_id = '1' 
AND release_year >= 1980 
AND release_year <= 1990;

-- UPDATE AND DELETE

** EXERCISE 1 Update & DELETE **

UPDATE albums SET release_year = '1972' WHERE id = '3';
SELECT id, release_year FROM albums WHERE release_year = '1972' AND id = '3';

*** CHALLENGE ***
UPDATE albums SET title = 'Waterloo', release_year = 1971 WHERE id = 1;
SELECT * FROM albums;

DELETE FROM albums WHERE id = 12;

-- CREATING NEW DATA
Intro 

INSERT INTO artists 
  (name, genre)
  VALUES('Massive Attack', 'Alternative');

  SELECT * FROM artists;

  ** EXERCISE 1 **
  
  INSERT INTO albums
  (title, release_year)
  VALUES('Mezzanine', '1998');

   SELECT * FROM albums;

   UPDATE albums SET artist_id = '5' WHERE id = 13;
    SELECT * FROM albums;

   *** CHALLENGE ***

    INSERT INTO artists 
  (name, genre)
  VALUES('Ms Rachel', 'Songs for Littles');

   SELECT * FROM artists;

  INSERT INTO albums
  (title, release_year)
  VALUES('Songs for littles', '2020');
  SELECT * FROM albums;

   UPDATE albums SET artist_id = '6' WHERE id = 14;
   SELECT * FROM albums;

  -- TABLE PLUS
 