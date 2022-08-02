require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require 'rspec'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  context 'Iteration 2' do
    it 'recipe exists' do
      expect(@recipe1).to be_an_instance_of(Recipe)
    end

    it 'recipe has a name' do
      expect(@recipe1.name).to eq("Mac and Cheese")
    end

    it 'recipe has no ingredients require by default' do
      expect(@recipe1.ingredients_required).to eq({})
    end

    it 'recipe can add required ingredients' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
      expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
    end
  end
end
