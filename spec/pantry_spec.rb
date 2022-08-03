require './lib/ingredient'
require './lib/pantry'
require 'rspec'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    @recipe1 = Recipe.new("Mac and Cheese")

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
  end

    it 'pantry exists' do
      expect(@pantry).to be_an_instance_of(Pantry)
    end

    it 'pantry is not stocked by default' do
      expect(@pantry.stock).to eq({})
    end

    it 'pantry can stock check ingredients' do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it 'pantry can restock ingredients' do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.stock_check(@ingredient1)).to eq(15)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.stock_check(@ingredient2)).to eq(7)
    end

    it 'can tell you if you have enough ingredients for the meal' do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
    end

    it 'can tell you when you have enough ingredients for the meal' do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      @pantry.restock(@ingredient2, 7)

      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

      @pantry.restock(@ingredient2, 1)

      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
    end
end
