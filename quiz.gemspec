require_relative 'lib/quiz/version'

Gem::Specification.new do |spec|
  spec.name          = "soccer-quiz"
  spec.version       = Quiz::VERSION
  spec.authors       = ["Yarvin Hernandez"]
  spec.email         = ["yarvinhhernandez@gmail.com"]

  spec.summary       = "10 questions quiz about soccer."
  spec.description   = "Find out how much you know about soccer."
  spec.homepage      = "https://rubygems.org/gems/soccer_quiz"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0") 
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
         `git ls-files -z`.split("\x0").reject { |f|  f.match(%r{^(test|spec|features)/}) }
    end
  spec.require_paths = ["lib"]
  spec.executables << "quiz"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  # spec.add_development_dependency "pry"
 end


