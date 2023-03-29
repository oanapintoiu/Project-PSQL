Artist Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).


1. Design and create the Table
 
 id: SERIAL
title: text
release_year: int


-- file: seeds_recipes.sql

-- Replace the table name, columm names and types.

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  avg_cooking_time text,
  rating int4
);

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

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

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 music_library_test < seeds_artists.sql
3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Artist
end

# Repository class
# (in lib/recipes_repository.rb)
class RecipesRepository
end
4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Artist

  # Replace the attributes by your own columns.
  attr_accessor :name, :avg_cooking_time, :rating
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: recipes

# Repository class
# (in lib/recipes_repository.rb)

class RecipesRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT name, avg_cooking_time, rating FROM recipes;

    # Returns an array of Artist objects.
  end

  # Select a single record
  # Given the id in an argument(a number)

  def find(id)
# Executes the SQL query
# SELECT name, avg_cooking_time, rating FROM recipes WHERE id = 1$

# Returns a single Artist object 
end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all artists

repo = RecipesRepository.new

recipes = repo.all
recipes.length # => 4
recipes.first.id => 1
recipes.first.name => 'Avocado Toast'
recipes.last.rating => 5
recipes.second.acg_cooking_time => '20 min'
Encode this example as a test.

repo = RecipesRepository.new

recipes = repo.find(3)
recipes.name # => 'Seafood Rissotto'
recipes.avg_cooking_time => '40 min'
recipes.rating => 1
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/recipes_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.