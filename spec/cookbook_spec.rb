require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'rspec'

RSpec.describe CookBook do
  before :each do
    @pantry = Pantry.new
    @cookbook = CookBook.new

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists' do
    expect(@cookbook).to be_an_instance_of(CookBook)
  end

  it 'can add recipes' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end

  it 'can return the total calories' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    expect(@recipe1.total_calories).to eq(440)
    expect(@recipe2.total_calories).to eq(675)
  end

  it 'can return the ingredients in the cookbook' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it 'can return the highest calorie meal' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
  end

  it 'can tell you if you have enough ingredients for the meal' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
  end

  it 'can tell you when you have enough ingredients for the meal' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 1)
    @pantry.enough_ingredients_for?(@recipe1)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end
