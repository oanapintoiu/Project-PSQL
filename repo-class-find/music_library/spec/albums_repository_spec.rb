require 'albums_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it 'returns the list of artists' do
    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.length).to eq(2)
    expect(albums.first.artist_id).to eq('1')
    expect(albums.first.title).to eq 'Songs for Littles'
    expect(albums.first.release_year).to eq '2020'
  end

  it 'returns album by id' do
    repo = AlbumRepository.new
    albums = repo.find(2)
    expect(albums.title).to eq 'Desperado'
    expect(albums.release_year).to eq '1995'
  end
end
