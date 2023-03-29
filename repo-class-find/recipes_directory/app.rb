require_relative 'lib/database_connection'
require_relative 'lib/recipes_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory_test')

recipes_repository = RecipesRepository.new

p recipes_repository.find(2)

recipes_repository.all.each do |recipe|
  p recipe
end

