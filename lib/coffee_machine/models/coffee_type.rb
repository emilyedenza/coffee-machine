module CoffeeMachine::Models

  # A type of coffee made by humans, and what ingredients you'll need.
  #
  # @author Dylan Boyd
  class CoffeeType

    # The two-letter symbol used to represent this type of coffee.
    #
    # @return [String]
    attr_reader :symbol

    # The full human-readable name of this coffee type.
    #
    # @return [String]
    attr_reader :name

    # What ingredients you'll need in the brewing process.
    #
    # @return [Array<String>]
    attr_reader :ingredients

    # @param symbol [String] The two-letter symbol used to represent this type
    #   of coffee.
    # @param name [String] The full human-readable name of this coffee type.
    # @param ingredients [Array<String>] What ingredients you'll need in the
    #   brewing process.
    def initialize(symbol, name, ingredients)
      @symbol = symbol
      @name = name
      @ingredients = ingredients
    end
  end

end
