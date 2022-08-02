require './lib/ingredient'
require './lib/pantry'
require 'rspec'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  context 'Iteration 1' do
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
  end
end
