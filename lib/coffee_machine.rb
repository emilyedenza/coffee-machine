# frozen_string_literal: true

require_relative "coffee_machine/version"

require 'coffee_machine/consumer'
require 'coffee_machine/producer'

require 'coffee_machine/models/coffee_order'
require 'coffee_machine/models/coffee_type'

require 'coffee_machine/data/coffee_types'

# Core components of the coffee demo to show Kafka and RBS functionality.
#
# @author Dylan Boyd
module CoffeeMachine
  class Error < StandardError; end
  # Your code goes here...
end
