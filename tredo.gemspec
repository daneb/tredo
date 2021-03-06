# frozen_string_literal: true

require_relative "lib/tredo/version"

Gem::Specification.new do |spec|
  spec.name = "tredo"
  spec.version = Tredo::VERSION
  spec.authors = ["Dane Balia"]
  spec.email = ["dane.balia@gmail.com"]

  spec.summary = "Facade for Todo Providers"
  spec.description = "Supports multiple or varied todo-list providers like Trello etc."
  spec.homepage = "https://github.com/daneb/tredo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/daneb/tredo"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jsender", "~> 2.2.0"
  spec.add_dependency "rest-client", "~> 2.1.0"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
