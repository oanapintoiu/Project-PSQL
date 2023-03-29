require_relative "recipe"

class RecipesRepository
  def all
    sql = 'SELECT name, avg_cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.name = record['name']
      recipe.avg_cooking_time = record['avg_cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    return recipes
  end

    def find(id)
      sql = 'SELECT name, avg_cooking_time, rating FROM recipes WHERE id = $1;'
      params = [id]
      result_set = DatabaseConnection.exec_params(sql, params)
  
      record = result_set[0]
  
      recipes = Recipe.new
      recipes.name = record['name']
      recipes.avg_cooking_time = record['avg_cooking_time']
      recipes.rating = record['rating']

    return recipes
  end
end
