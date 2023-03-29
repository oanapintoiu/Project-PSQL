require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

artist_repository = ArtistRepository.new
albums_repository = AlbumRepository.new

p albums_repository.find(1)
p artist_repository.find(1)

albums_repository.all.each do |album|
  p album
end

artist_repository.all.each do |album|
  p album
end
