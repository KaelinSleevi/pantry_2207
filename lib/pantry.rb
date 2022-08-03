class Pantry
  attr_reader :stock

  def initialize()
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    enough = []
    recipe.ingredients.each do |ingredient|
      enough << (@stock[ingredient] >= recipe.ingredients_required[ingredient])
    end
    enough.all?
  end
end
