module CoffeeMachine::Models

  class CoffeeType
    attr_reader :symbol
    attr_reader :name
    attr_reader :ingredients

    def initialize(symbol, name, ingredients)
      @symbol = symbol
      @name = name
      @ingredients = ingredients
    end
  end

end
