class Pantry
  attr_reader :stock,
              :check

  def initialize()
    @stock = {}
    @check = 0
  end

  def stock_check(ingredient)
    @check
  end

  def restock(ingredient, amount)
    @stock[ingredient] = amount
    @check += amount
  end
end
