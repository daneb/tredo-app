require_relative "lib/todo_component/version"

Gem::Specification.new do |spec|
  spec.name = "todo_component"
  spec.version = TodoComponent::VERSION
  spec.authors = ["Dane Balia"]
  spec.email = ["daneb@tuta.io"]
  spec.summary = "Todo Manager"
  spec.description = "A Rails based component for managing todos using cloud-based provider."
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end
