require 'recipes_repository'

RSpec.describe RecipesRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  it 'returns the list of recipes' do
    repo = RecipesRepository.new

    recipes = repo.all

    expect(recipes.length).to eq(4)
    expect(recipes.first.name).to eq 'Avocado Toast'
    expect(recipes.last.rating).to eq '5'
    expect(recipes.first.avg_cooking_time).to eq '10 min'
  end
  
    it 'returns single artist' do
    repo = RecipesRepository.new

    recipes = repo.find(3)
    expect(recipes.name).to eq 'Seafood Risotto'
    expect(recipes.avg_cooking_time).to eq '40 min'
    expect(recipes.rating).to eq '1'
  end
end
