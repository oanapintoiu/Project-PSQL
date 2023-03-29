lbums Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.



1. Design and create the Table
TABLE ALREADY CREATED

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES ('ABBA', 'Pop');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 music_library_test < seeds_artists.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
#
# EXAMPLE
# Table name: albums

# Model class
# (in lib/album.rb)
class Artist
end

# Repository class
# (in lib/albums_repository.rb)
class ArtistRepository
end
4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: album

# Model class
# (in lib/album.rb)

class Artist

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :release_year, :artist_id
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
# Table name: albums

# Repository class
# (in lib/albums_repository.rb)

class ArtistRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # 'SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Artist objects.
  end
end

def find(id)
# Executes the SQL query
# SELECT if, name, genre FROM artists WHERE id = 1$

# Returns a single Artist object 
end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all artists

repo = ArtistRepository.new

albums = repo.all
 expect(albums.length).to eq(2)
    expect(albums.first.artist_id).to eq('1')
    expect(albums.first.title).to eq 'Songs for Littles'
    expect(albums.first.release_year).to eq '2020'
Encode this example as a test.




  repo = AlbumRepository.new
    albums = repo.find(2)
    albums.title =>'Desperado'
    albums.release_year =>'1995'

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds_albumss.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test2' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_albums_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.