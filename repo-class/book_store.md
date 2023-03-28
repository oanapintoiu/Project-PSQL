lbums Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
TABLE ALREADY CREATED

2. Create Test SQL seeds

DROP TABLE IF EXISTS "public"."books";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS books_id_seq;

-- Table Definition
CREATE TABLE "public"."books" (
    "id" SERIAL,
    "title" text,
    "author_name" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."books" ("id", "title", "author_name") VALUES
(1, 'Nineteen Eighty-Four', 'George Orwell'),
(2, 'Mrs Dalloway', 'Virginia Woolf'),
(3, 'Emma', 'Jane Austen'),
(4, 'Dracula', 'Bram Stoker'),
(5, 'The Age of Innocence', 'Edith Wharton');

psql -h 127.0.0.1 music_library_test < seeds_artists.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: books

# Model class
# (in lib/books.rb)
class Book
end

# Repository class
# (in lib/books_repository.rb)

class BooksRepository
end

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: books

# Model class
# (in lib/books.rb)

class Book

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :author_name
end



5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: books

# Repository class
# (in lib/books_repository.rb)

class BookRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # 'SELECT id, title, author_name FROM books;

    # Returns an array of Book objects.
  end
end


6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all books

repo = BookRepository.new

books = repo.all

books = repo.all
books.lenght => 5
books.first.id => 1
books.first.title => 'Nineteen Eighty-Four'
books.last.titel => 'The Age of Innocence'
books.first.author_name => George Orwell


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.