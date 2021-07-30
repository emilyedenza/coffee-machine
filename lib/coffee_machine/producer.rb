require 'json'
require 'kafka'

module CoffeeMachine
  class Producer
    def self.run(broker_url, order_id_prefix)
      $kafka = Kafka.new(broker_url, client_id: order_id_prefix)

      separator = '*' * 30
      $next_order_id = 1

      $queue_name = ARGV[0]
      if !$queue_name
        abort 'Usage: ruby coffee-producer.rb {queue_name}'
      end

      puts separator
      puts 'Welcome to the coffee machine!'
      puts separator

      loop do
        run_coffee_loop
      end
    end

    private

    # Keep asking for more and more coffee, because one can never have enough.
    def self.run_coffee_loop
      puts
      print 'What\'s your name, friend? '
      name = STDIN.gets.chomp

      while !name
        print 'Sorry, I didn\'t catch that. I won\'t laugh... what\'s your name? '
        name = STDIN.gets.chomp
      end

      puts "Hi #{name}. Let\'s order you some coffee. What would you like?"
      puts

      for c in CoffeeMachine::Data::CoffeeTypes.available_types
        puts "[ #{c.symbol} ]  #{c.name}"
      end

      puts
      print 'Pick your poison: '
      chosen_symbol = STDIN.gets.chomp
      chosen_coffee_type = CoffeeMachine::Data::CoffeeTypes.available_types.detect { |t| t.symbol.downcase == chosen_symbol.downcase }

      until chosen_coffee_type
        print 'That doesn\'t seem quite right. Can you try that again? '
        chosen_symbol = STDIN.gets.chomp
        chosen_coffee_type = CoffeeMachine::Data::CoffeeTypes.available_types.detect { |t| t.symbol.downcase == chosen_symbol.downcase }
      end

      puts
      print 'Thanks. Would you like that to settle before being served? [y\N]: '
      should_settle = STDIN.gets.chomp == 'y'

      order_id = "#{$queue_name}-#{$next_order_id}"
      $next_order_id += 1
      order = { chosen_coffee_type: chosen_symbol, should_settle: should_settle, name: name, order_id: order_id }
      $kafka.deliver_message(order.to_json, topic: 'coffee', partition_key:
                             chosen_symbol)

      puts
      puts "Great. We\'re brewing that up for you now. Your order number is "\
        "#{order_id}."
    end
  end
end
