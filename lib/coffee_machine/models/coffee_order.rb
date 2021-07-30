module CoffeeMachine::Models
  # Defines an order for a single coffee. No, you can't order more than one.
  #
  # @author Dylan Boyd
  class CoffeeOrder

    # You need to know whether your customer wants milk with some coffee, or
    # pure adrenaline in powder form.
    #
    # @return [String] the codename for the type of coffee
    attr_reader :kind

    # Is the froth just a little too much for you? Let it settle after brewing.
    #
    # @return [Boolean] whether the coffee should settle before serving
    attr_reader :allow_to_settle

    # Are you making coffee for imaginary people? I didn't think so. For whom
    # is this beverage intended?
    #
    # @return [String] the customer name
    attr_reader :for_whom

    # You need to quickly identify that order. How, you ask? With this.
    #
    # @return [String] the unique order identifier
    attr_reader :order_id

    # Start up a new coffee order, for when your customers are sleepy.
    #
    # @param kind [String] the codename for the type of coffee
    # @param allow_to_settle [Boolean] whether the coffee should settle before
    #   serving
    # @param for_whom [String] the customer name
    # @param order_id [String] the unique order identifier
    # @return [CoffeeOrder] all of the coffees
    def initialize(kind, allow_to_settle, for_whom, order_id)
      @kind = kind
      @allow_to_settle = allow_to_settle
      @for_whom = for_whom
      @order_id = order_id
    end
  end
end
