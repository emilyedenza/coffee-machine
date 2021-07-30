# The Coffee Machine

This demo is to illustrate a basic use case of Ruby 3.0 and Kafka. This will
show how RBS typing can be used alongside an operating copy of Kafka as part of
a demo day.

![Coffee making
demo](https://github.com/dylanboydgc/kafka-demo/raw/main/demo.gif)

## Requirements

- Ruby >= 3.0.2
- Bundler >= 2.2.2
- Docker >= 20.10.7
- Docker Compose >= 2.0.0-beta.6 (though earlier should work)
- A little patience and Command Line Fu

## Quickstart

1. Get an instance of Kafka running. I'm using [the Confluent
   all-in-one](https://github.com/confluentinc/cp-all-in-one) repository and
   following their `docker-compose` example using the `cp-all-in-one` directory
   located within the repo.
2. Clone this repository.
3. `cd` into the repository directory and run `bundle` to install dependencies.
4. `bundle exec exe/coffee_machine produce` to start the producer.
5. `bundle exec exe/coffee_machine consume` to start the consumer.
6. Follow the producer prompts to add coffee orders.
7. Watch your coffee orders come through on the consumer.
8. Profit.
9. Drink actual coffee.
10. Multiply profit.

## Misc

If you want to use another Kafka broker, you can provide the URL to the
consumer and provider with the `--broker` switch on each.

This hasn't been tested with multiple brokers or any scalable or practical
Kafka configuration as of yet, but shouldn't require much tweaking to get it
working. The partition group is set to the type of coffee being ordered, which
may not be the best option imagining this to become a real-world scalable app,
but worth considering nonetheless.

You can generate [YARD](https://github.com/lsegal/yard) docs and run a web
server to show them in a convenient human-readable format by running `yard
server` in the repository root. These can be accessed at the URL shown in the
terminal.

This uses [Sord](https://github.com/AaronC81/sord) to generate documentation
for [https://github.com/sorbet/sorbet](https://github.com/sorbet/sorbet) and
for Ruby 3's [RBS](https://github.com/ruby/rbs). It may not be complete, but
exists as an evolving learning/teaching platform and a proof of concept.

