# frozen_string_literal: true

require_relative "lib/coffee_machine/version"

Gem::Specification.new do |spec|
  spec.name          = "coffee_machine"
  spec.version       = CoffeeMachine::VERSION
  spec.authors       = ["Dylan Boyd"]
  spec.email         = ["dylan@glamcorner.com.au"]

  spec.summary       = "Demonstrates Ruby 3, RBS, Sorbet, and Kafka functionality for a company demo."
  spec.homepage      = "https://github.com/dylanboydgc/coffee-machine"
  spec.required_ruby_version = ">= 3.0.2"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dylanboydgc/coffee-machine"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_dependency 'ruby-kafka'
  spec.add_dependency 'yard'
  spec.add_dependency 'sord'
  spec.add_dependency 'webrick'
  spec.add_dependency 'rack'
  spec.add_dependency 'commander'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
