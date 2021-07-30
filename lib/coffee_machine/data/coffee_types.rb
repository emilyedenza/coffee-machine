module CoffeeMachine::Data

  # The coffee types you can order right here, right now.
  class CoffeeTypes
    # List all available types of coffee and their attributes.
    #
    # @return [Array<CoffeeMachine::Models::CoffeeType>]
    def self.available_types
      [
        CoffeeMachine::Models::CoffeeType.new('bl', 'Black', ['Coffee']),
        CoffeeMachine::Models::CoffeeType.new('la', 'Latte', ['Espresso', 'Steamed milk']),
        CoffeeMachine::Models::CoffeeType.new('ca', 'Cappuccino', ['Espresso', 'Steamed milk', 'Foam']),
        CoffeeMachine::Models::CoffeeType.new('am', 'Americano', ['Espresso', 'Hot water']),
        CoffeeMachine::Models::CoffeeType.new('es', 'Espresso', ['Espresso']),
        CoffeeMachine::Models::CoffeeType.new('do', 'Doppio', ['Espresso']),
        CoffeeMachine::Models::CoffeeType.new('co', 'Cortado', ['Espresso', 'Steamed milk']),
        CoffeeMachine::Models::CoffeeType.new('re', 'Red Eye', ['Espresso', 'Coffee']),
      ]
    end
  end
end
