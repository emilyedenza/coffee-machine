require 'kafka'
require 'json'

module CoffeeMachine
  class Consumer
    def self.run(broker_url)
      kafka = Kafka.new(broker_url)

      consumer = kafka.consumer(group_id: 'coffee-consumer')
      consumer.subscribe('coffee')
      trap('TERM') { consumer.stop }

      puts 'Listening for them coffee orders...'

      consumer.each_message do |msg|
        order = JSON.parse(msg.value)
        if !order || !order.key?('chosen_coffee_type')
          puts 'Skipping invalid order.'
          next
        end

        coffee_type = CoffeeMachine::Data::CoffeeTypes.available_types.detect { |t| t.symbol == order['chosen_coffee_type'] }

        puts
        puts "\u{2615} #{coffee_type.name} for #{order['name']} coming right up."
        if order['should_settle']
          puts 'Letting it settle...'
        end
        puts "\u{2705} Done! Enjoy that beverage."
      end
    end
  end
end
