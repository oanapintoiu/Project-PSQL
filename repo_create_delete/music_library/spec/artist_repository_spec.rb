require 'artist_repository'

RSpec.describe ArtistRepository do
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artists_table
  end

  it 'returns the list of artists' do
    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq(2)
    expect(artists.first.id).to eq('1')
    expect(artists.first.name).to eq 'Ms Rachel'
  end

  it 'returns single artist' do
    repo = ArtistRepository.new
    artists = repo.find(1)
    expect(artists.genre).to eq 'children songs'
    expect(artists.name).to eq 'Ms Rachel'
  end

  it 'creates a new artist' do
    repo = ArtistRepository.new
    artist = Artist.new
    artist.genre = 'pop'
    artist.name = 'Beatles'

    repo.create(artist)

    artists = repo.all
    last_artist = artists.last
    expect(last_artist.name).to eq 'Beatles'
    expect(last_artist.genre).to eq 'pop'
  end

  it 'deletes two artists' do
    repo = ArtistRepository.new

    repo.delete(1)
    repo.delete(2)

    all_artists = repo.all
    expect(all_artists.length).to eq(0)
    # expect(all.artists.first.id).to eq('2')
  end

  it 'updates artist with new values' do
    repo = ArtistRepository.new

    artist = repo.find(1)

    artist.name = 'something'
    artist.genre = 'disco'

    repo.update(artist)

    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq 'something'
    expect(updated_artist.genre).to eq 'disco'
  end

  it 'updates only updates the name' do
    repo = ArtistRepository.new

    artist = repo.find(1)

    artist.name = 'something'

    repo.update(artist)

    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq 'something'
    expect(updated_artist.genre).to eq 'children songs'
  end
end
