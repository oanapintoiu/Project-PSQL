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

  it 'returns the list of albums' do
    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.length).to eq(3)
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

  it "adds a new album to the database" do
    repo = AlbumRepository.new

    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = 1991
    new_album.artist_id = 1

    repo.create(new_album)
    albums = repo.all
    new_album = albums.last

    expect(new_album.title).to eq 'Trompe le Monde'
    expect(new_album.release_year).to eq '1991'
    expect(new_album.artist_id).to eq '1'
  end

  it "deletes an album by its id" do
    repo = AlbumRepository.new

    repo.delete(1)
    repo.delete(2)

    all_albums = repo.all
    expect(all_albums.length).to eq(1)
  end

  it "updates an album with new values" do
    repo = AlbumRepository.new
    album = repo.find(1) # get the object we want to update

    album.title = 'Songs for Littles'
    album.release_year = 2020

    repo.update(album)
    updated_album = repo.find(1)

    expect(updated_album.title).to eq 'Songs for Littles'
    expect(updated_album.release_year).to eq '2020'
  end
end
