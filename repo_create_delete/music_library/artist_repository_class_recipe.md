Artist Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
TABLE ALREADY CREATED

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES ('ABBA', 'Pop');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 music_library_test < seeds_artists.sql
3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: artists

# Model class
# (in lib/artist.rb)
class Artist
end

# Repository class
# (in lib/artist_repository.rb)
class ArtistRepository
end
4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: artists

# Model class
# (in lib/artist.rb)

class Artist

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cohort_name
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
# Table name: artists

# Repository class
# (in lib/artists_repository.rb)

class ArtistRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end

  # Select a single record
  # Given the id in an argument(a number)

  def find(id)
# Executes the SQL query
# SELECT if, name, genre FROM artists WHERE id = 1$

# Returns a single Artist object 
end

def create(artist)
# Executes the sql query;
# INSERT INTO artists (name, genre) VALUES($1, $2);

# Doesn't need to return anything, only creates the record
end

def delete(id)
# Deletes an artist record
# DELETE FROM artists WHERE id = $1;

# Returns nothing, only deletes the record

end

def update(artist)
# Executes SQL
# UPDATE artists SET name = $1, genre = $2 WHERE = $3

# Returns nothing, only updates the record
end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all artists

<!-- 1. Initial check -->
repo = ArtistRepository.new

artists = repo.all
artists.length # => 2
artists.first.id => 1
artists.first.name => 'Ms Rachel'
Encode this example as a test.

<!-- 2. Find a single artist -->

repo = ArtistRepository.new

artists = repo.find(2)
artists.genre # => 'children songs'
artists.name => 'Ms Rachel'
Encode this example as a test.

<!-- 3. Create a new artist repo -->

repo = ArtistRepository.new
artist = Artist.new
artists.genre # => 'pop'
artists.name => 'Beatles'

repo.create(artist) # => nil

artists = repo.all 
last_artist = artists.last
last_artist.name # => 'Beatles"
last_artist.genre # => 'Pop'

<!-- 4. Delete and artist -->

repo = ArtistRepository.new

id_to_delete = 1

repo.delete(id_to_delete)

all_artists = repo.all
all_artists.lenght => 1
all.artists.first.id => 2

<!-- Update artists -->

repo = ArtistsRepository.new

artist = repo.find(1)

artist.name = 'something'
asrtst.genre = 'disco'

repo.update(1)

updated_artist.name => 'something'
updated_artist.genre => 'disco'


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_artists_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

