require './lib/ingredient'
require './lib/pantry'
require 'rspec'

RSpec.describe Ingredient do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  context 'Iteration 1' do
    it 'ingredients exist' do
      expect(@ingredient1).to be_an_instance_of(Ingredient)
      expect(@ingredient2).to be_an_instance_of(Ingredient)
    end

    it 'ingredients has a name' do
      expect(@ingredient1.name).to eq("Cheese")
    end

    it 'ingredients has a unit of measurement' do
      expect(@ingredient1.unit).to eq("oz")
    end

    it 'ingredient 1 has an amount of calories' do
      expect(@ingredient1.calories).to eq(50)
    end
  end
end
