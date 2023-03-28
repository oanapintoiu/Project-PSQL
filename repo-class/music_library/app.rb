require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test2')

music_library_repository = AlbumRepository.new

p music_library_repository.all