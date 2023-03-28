require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

artist_repository = BookRepository.new

p artist_repository.all

end