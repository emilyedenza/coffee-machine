# typed: strong
# Core components of the coffee demo to show Kafka and RBS functionality.
# 
# @author Dylan Boyd
module CoffeeMachine
  VERSION = T.let("0.1.0", T.untyped)

  class Error < StandardError
  end

  # Runs the consumer portion of the Kafka coffee machine.
  # 
  # @author Dylan Boyd
  class Consumer
    # Run the consumer interactively in a terminal
    # 
    # _@param_ `broker_url` — The Kafka broker URL to consume from.
    sig { params(broker_url: String).void }
    def self.run(broker_url); end
  end

  # Runs the producer portion of the Kafka coffee machine.
  # 
  # @author Dylan Boyd
  class Producer
    # Run the coffee producer interactively to provide brewing parameters.
    # 
    # _@param_ `broker_url` — The Kafka broker URL to consume from.
    # 
    # _@param_ `order_id_prefix` — What to prefix every order ID with.
    sig { params(broker_url: String, order_id_prefix: String).void }
    def self.run(broker_url, order_id_prefix); end

    # Keep asking for more and more coffee, because one can never have enough.
    sig { void }
    def self.run_coffee_loop; end
  end

  module Data
    # The coffee types you can order right here, right now.
    class CoffeeTypes
      # List all available types of coffee and their attributes.
      sig { returns(T::Array[CoffeeMachine::Models::CoffeeType]) }
      def self.available_types; end
    end
  end

  module Models
    # A type of coffee made by humans, and what ingredients you'll need.
    class CoffeeType
      # _@param_ `symbol` — The two-letter symbol used to represent this type of coffee.
      # 
      # _@param_ `name` — The full human-readable name of this coffee type.
      # 
      # _@param_ `ingredients` — What ingredients you'll need in the brewing process.
      sig { params(symbol: String, name: String, ingredients: T::Array[String]).void }
      def initialize(symbol, name, ingredients); end

      # The two-letter symbol used to represent this type of coffee.
      sig { returns(String) }
      attr_reader :symbol

      # The full human-readable name of this coffee type.
      sig { returns(String) }
      attr_reader :name

      # What ingredients you'll need in the brewing process.
      sig { returns(T::Array[String]) }
      attr_reader :ingredients
    end

    # Defines an order for a single coffee. No, you can't order more than one.
    # 
    # @author Dylan Boyd
    class CoffeeOrder
      # Start up a new coffee order, for when your customers are sleepy.
      # 
      # _@param_ `kind` — the codename for the type of coffee
      # 
      # _@param_ `allow_to_settle` — whether the coffee should settle before serving
      # 
      # _@param_ `for_whom` — the customer name
      # 
      # _@param_ `order_id` — the unique order identifier
      # 
      # _@return_ — all of the coffees
      sig do
        params(
          kind: String,
          allow_to_settle: T::Boolean,
          for_whom: String,
          order_id: String
        ).void
      end
      def initialize(kind, allow_to_settle, for_whom, order_id); end

      # You need to know whether your customer wants milk with some coffee, or
      # pure adrenaline in powder form.
      # 
      # _@return_ — the codename for the type of coffee
      sig { returns(String) }
      attr_reader :kind

      # Is the froth just a little too much for you? Let it settle after brewing.
      # 
      # _@return_ — whether the coffee should settle before serving
      sig { returns(T::Boolean) }
      attr_reader :allow_to_settle

      # Are you making coffee for imaginary people? I didn't think so. For whom
      # is this beverage intended?
      # 
      # _@return_ — the customer name
      sig { returns(String) }
      attr_reader :for_whom

      # You need to quickly identify that order. How, you ask? With this.
      # 
      # _@return_ — the unique order identifier
      sig { returns(String) }
      attr_reader :order_id
    end
  end
end
