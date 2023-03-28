require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

artist_repository = ArtistRepository.new

p artist_repository.all

end