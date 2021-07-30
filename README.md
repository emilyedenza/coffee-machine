# The Coffee Machine

This demo is to illustrate a basic use case of Ruby 3.0 and Kafka. This will
show how RBS typing can be used alongside an operating copy of Kafka as part of
a demo day.

![Coffee making
demo](https://github.com/dylanboydgc/kafka-demo/raw/main/demo.gif)

## Quickstart

1. Get an instance of Kafka running. I'm using [the Confluent
   all-in-one](https://github.com/confluentinc/cp-all-in-one) repository and
   following their `docker-compose` example using the `cp-all-in-one` directory
   located within the repo.
2. Run the consumer using `KAFKA_BROKER=localhost:9092 ruby
   coffee-consumer.rb`, replacing the broker URL where needed.
3. Run the producer in a similar fashion:
   `KAFKA_BROKER=localhost:9092 ruby coffee-producer.rb my-unique-id`. Replace
   `my-unique-id` with anything you'd like order numbers to be prefixed with.
4. Interact with the terminal prompt to send orders through the producer.
5. Watch your coffee orders come through on the consumer.
6. Profit.
7. Drink actual coffee.
8. Multiply profit.

