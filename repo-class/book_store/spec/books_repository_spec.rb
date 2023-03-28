require 'books_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it 'returns all books from the list' do
    repo = BookRepository.new

    books = repo.all
    expect(books.length).to eq 5
    expect(books.first.id).to eq '1'
    expect(books.first.title).to eq 'Nineteen Eighty-Four'
    expect(books.last.title).to eq 'The Age of Innocence'
    expect(books.first.author_name).to eq 'George Orwell'
  end
end
