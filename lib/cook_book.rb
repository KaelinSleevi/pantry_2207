class CookBook
  attr_reader :recipes,
              :ingredients

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
    recipe.ingredients.each do |ingredient|
      @ingredients << ingredient.name
    end
    @ingredients = @ingredients.uniq
  end

  def highest_calorie_meal
    @recipes.sort { |recipe1, recipe2| recipe1.total_calories <=> recipe2.total_calories }.first
  end
end
