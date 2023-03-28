require_relative 'lib/database_connection'
require_relative 'lib/books_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

repo = BookRepository.new

repo.all.each do |books|
puts "#{books.id} - #{books.title} - #{books.author_name}"
end