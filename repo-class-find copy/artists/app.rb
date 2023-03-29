require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

artist_repository = ArtistRepository.new
albums_repository = AlbumRepository.new

artist_repository.all.each. do |artist|
    p artist
end

albums_repository.all.each do |album|
    p album

end