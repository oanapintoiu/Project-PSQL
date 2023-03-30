Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a music promoter,
So I can organise concerts,
I want to record a list of all scheduled cocerts
With their artist name, cocert and venue.

As a music promoter,
So I can organise concerts,
I want to sore the name and capacity for each venue

As a music lover,
So I can organise concerts,
I want to be able to list all cocerts at a given venue.


Nouns:

scheduled cocerts, astist name, concert dates, venue
venue name, venue capacity



2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.


|  Record                       |    Properties                    |
| ------------------------------|----------------------------------|
|   concerts                    | astist_name, scheduled_date      |
|   venues                      | name, capacity                   |



Name of the first table (always plural): concerts

Column names: astist_name, scheduled_date

Name of the second table (always plural): venues

Column names: name, capacity

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: concerts
id: SERIAL
artist_name text
scheduled_date timestamp

Table: venues
id: SERIAL
name text
capacity int

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one concert have many venues? YES
2. Can one venue have many concerts? YES


-> Therefore,
-> An avenue HAS MANY concerts
-> A concert BELONGS TO a venut

-> Therefore, the foreign key is on the concert table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

Foreigh key (concerts) - venue_id

venues
1 O2
2 Scala

concerts 
                venue id
1 Pixies            1
2 ABBA              1

4. Write the SQL.
-- EXAMPLE
-- file: concets_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE venues (
  id SERIAL PRIMARY KEY,
  name text,
  capacity int
);

-- Then the table with the foreign key first.
CREATE TABLE concert (
  id SERIAL PRIMARY KEY,
  artist_name text,
  scheduled_date timestamp,
-- The foreign key name is always {other_table_singular}_id
  venue_id int,
  constraint fk_venue_1 foreign key (venue_id) references venues(id)
    on delete cascade
);
5. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql