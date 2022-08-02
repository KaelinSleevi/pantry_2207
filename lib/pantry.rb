class Pantry
  attr_reader :stock

  def initialize()
    @stock = {}
  end

  def stock_check(ingredient)
    @stock.values.count{ |ingredient, amount| amount == ingredient}
  end

  def restock(ingredient, amount)
    if @stock.key?(ingredient)
      @stock[ingredient] += 1
    end
  end
end
